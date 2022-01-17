package egovframework.sth.domain.member.Utils;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.service.MailHandler;

@Component
public class MyUtils {

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Bean
	public JavaMailSenderImpl mailSender() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setProtocol("smtp");
		javaMailSender.setHost("smtp.gmail.com");
		javaMailSender.setPort(587);
		return javaMailSender;
	}        

	@Autowired
	HttpSession session;

	// 세션에 "loginMember" 키 값으로 저장된 MemberDTO 객체를 리턴
	public MemberDTO getLoginMember() {
		try {
			return (MemberDTO) session.getAttribute("loginMember");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void mailSender(String to, String subject, String txt)
			throws MessagingException, UnsupportedEncodingException {
		MailHandler mailHandler = new MailHandler(javaMailSender);
		mailHandler.setSubject(subject); // 이메일 제목
		mailHandler.setText(txt); // 이메일 내용
		mailHandler.setFrom("green6442278@gmail.com", "StreetToHome"); // 보내는 사람 이메일
		mailHandler.setTo(to); // 받는 사람 이메일
		mailHandler.send();
	}

}
