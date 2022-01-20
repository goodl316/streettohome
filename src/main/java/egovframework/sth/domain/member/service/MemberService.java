package egovframework.sth.domain.member.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.mapper.MemberMapper;
import egovframework.sth.domain.member.Utils.MyUtils;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private HttpSession session;

	@Autowired
	private MyUtils myUtils;

	// 회원 가입
	@Async("threadPoolTaskExecutor")
	public void join(MemberDTO param) throws MessagingException, UnsupportedEncodingException {

		if (param.getM_pw() != null) {
			String crypPw = BCrypt.hashpw(param.getM_pw(), BCrypt.gensalt());
			param.setM_pw(crypPw);

			// 사용자에게 랜덤 키 생성
			String key = new TempKey().getKey(50, false);
			param.setM_auth(key);

			// 사용자에게 보내지는 메일 작성
			String text = String.format(
					"<a href='http://localhost:8088/member/emailConfirm?m_email=%S&m_auth=%s'target='_blank'>이메일 인증 확인</a>,",
					param.getM_email(), key);
			String subject = "STREET TO HOME 이메일 인증";
			myUtils.mailSender(param.getM_email(), subject, text);

			mapper.insMember(param);
		}
	}

	public int login(MemberDTO param) {

		MemberDTO result = mapper.selMember(param);

		if (result == null) {
			// 이메일 없음
			return 0;
		} else if (BCrypt.checkpw(param.getM_pw(), result.getM_pw())) {
			// 로그인 성공
			result.setM_pw(null);
			System.out.println("성공");
			session.setAttribute("loginMember", result);

			return 1;
		} else {
			// 비밀번호 틀림
			return 0;
		}
	}

	// 이메일 중복 확인
	public int emailChk(MemberDTO param) {
		int result = mapper.emailChk(param);
		return result;
	}

	// 닉네임 중복 확인
	public int nameChk(MemberDTO param) {
		int result = mapper.nameChk(param);
		return result;
	}

	// 이메일 인증
	public int chckM_auth(MemberDTO param) {
		MemberDTO result = mapper.chckM_auth(param);
		if (result == null) {

			// 인증이 옳바르지 않음
			return 0;
		} else {
			// 인증 성공
			return 1;
		}

	}

	// 인증 상태
	public int upM_authstate(MemberDTO param) {
		return mapper.upM_authstate(param);
	}

	// 회원정보 수정
	public String updateMember(MemberDTO param) {

		String hashPw = BCrypt.hashpw(param.getM_pw(), BCrypt.gensalt());
		param.setM_pw(hashPw);
		mapper.updateMember(param);
		return "/member/login";
	}

	//비밀번호 찾기 이메일발송
	public void sendEmail(MemberDTO param, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "green6442278@gmail.com";
		String hostSMTPpwd = "atpnoahhhnpbgjiy";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "green6442278@gmail.com";
		String fromName = "STREET TO HOME";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "STREET TO HOME 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += param.getM_name() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += param.getM_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = param.getM_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비밀번호 찾기
//	@Override
//	public void findPw(HttpServletResponse response, MemberDTO vo) throws Exception {
//		response.setContentType("text/html;charset=utf-8");
//		MemberDTO ck = mdao.readMember(vo.getId());
//		PrintWriter out = response.getWriter();
//		// 가입된 아이디가 없으면
//		if(mdao.idCheck(vo.getId()) == null) {
//			out.print("등록되지 않은 아이디입니다.");
//			out.close();
//		}
//		// 가입된 이메일이 아니면
//		else if(!vo.getEmail().equals(ck.getEmail())) {
//			out.print("등록되지 않은 이메일입니다.");
//			out.close();
//		}else {
//			// 임시 비밀번호 생성
//			String pw = "";
//			for (int i = 0; i < 12; i++) {
//				pw += (char) ((Math.random() * 26) + 97);
//			}
//			vo.setPw(pw);
//			// 비밀번호 변경
//			mdao.updatePw(vo);
//			// 비밀번호 변경 메일 발송
//			sendEmail(vo, "findpw");
//
//			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
//			out.close();
//		}
//	}
}
