package egovframework.sth.domain.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

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
					"<a href='http://localhost:8088/member/emailConfirm?m_email=%S&M_auth=%s'target='_blank'>이메일 인증 확인</a>,",
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

	            //인증이 옳바르지 않음
	            return 0;
	        } else {
	            //인증 성공
	            return 1;
	        }
		
	}
	
	// 인증 상태
	public int upM_authstate(MemberDTO param) {
		return mapper.upM_authstate(param);
	}
	
	// 회원정보 수정
	public String updateMember(MemberDTO param){
		
		String hashPw = BCrypt.hashpw(param.getM_pw(), BCrypt.gensalt());
		param.setM_pw(hashPw);
		mapper.updateMember(param);
		return "/member/login";
	}
	

}
