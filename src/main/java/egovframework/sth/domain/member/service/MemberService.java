package egovframework.sth.domain.member.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.member.Utils.MyUtils;
import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private HttpSession session;

	@Autowired
	private MyUtils myUtils;

	// 회원 가입
	public int join(MemberDTO param) throws MessagingException, UnsupportedEncodingException {

		if (param.getM_pw() != null) {
			String crypPw = BCrypt.hashpw(param.getM_pw(), BCrypt.gensalt());
			param.setM_pw(crypPw);

			// 사용자에게 랜덤 키 생성
			String key = new TempKey().getKey(50, false);
			param.setM_auth(key);

			// 사용자에게 보내지는 메일 작성
			String text = String.format(
					"<a href='http://localhost:8080/member/emailConfirm?m_email=%S&m_auth=%s'target='_blank'>이메일 인증 확인</a>,",
					param.getM_email(), key);
			String subject = "STREET TO HOME 이메일 인증";
			myUtils.mailSender(param.getM_email(), subject, text);

			return mapper.insMember(param);
		}else {
			return 0;
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
	public int updateMember(MemberDTO param) {
		System.out.println(param.getM_pw());
		if (param.getM_pw() != null) {
		String hashPw = BCrypt.hashpw(param.getM_pw(), BCrypt.gensalt());
		param.setM_pw(hashPw);
		}
		System.out.println(param.getM_pw());
		return mapper.updateMember(param);
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
	public void findPw(HttpServletResponse response, MemberDTO param) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberDTO ck = mapper.readMember(param);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(ck == null) {
			out.print("등록되지 않은 사용자입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			param.setM_pw(pw);
			
			sendEmail(param, "findpw");
		
			String hashPw = BCrypt.hashpw(param.getM_pw(), BCrypt.gensalt());
			param.setM_pw(hashPw);
			mapper.updatePw(param);
			

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	public void findemail(HttpServletResponse response, MemberDTO param) throws Exception  {
		response.setContentType("text/html;charset=utf-8");
		MemberDTO chk = mapper.findemail(param);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(chk == null) {
			out.print("등록되지 않은 사용자입니다.");
			out.close();
		} else {
			out.print("이메일은 " + chk.getM_email() + "입니다.");
			out.close();
		}
	}
	
	public int memberDelete(MemberDTO param) throws Exception {
		MemberDTO member = mapper.selMember(param);
		if (param.getM_pw() != null && BCrypt.checkpw(param.getM_pw(), member.getM_pw())) {
			return mapper.memberDelete(param);
		}
		return 0;		
	}
}
	