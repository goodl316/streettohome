package egovframework.sth.domain.member.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.service.MemberService;
import egovframework.sth.domain.member.service.TempKey;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 1. 로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/member/login";
	}

	// 2. 로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO param, Model model) {
		if (memberService.login(param) == 0) {
			model.addAttribute("Msg", "이메일 또는 비밀번호를 확인해주세요.");
			return "/member/login";
		} else {
			return "/main";
		}
	}

	// 3. 로그아웃 기능
	@RequestMapping("/logout")
	public String logout(HttpSession hs, HttpServletRequest req) {
		hs.invalidate(); // 세션 종료
		String referer = req.getHeader("REFERER");
		return "redirect:" + referer;
	}

	// 2. 회원가입 화면
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}

	// 3. 회원가입 기능
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDTO param, Model model) throws MessagingException, UnsupportedEncodingException {
		model.addAttribute("Msg", "가입시 사용한 이메일로 인증해 주세요.");
		System.out.println(param.toString());
		memberService.join(param);
		return "/member/login";
	}

	// 이메일 중복 체크
	@ResponseBody // 비동기 통신 (화면 전환 없이 이루어지는 동작)
	@RequestMapping(value = "emailChk", method = RequestMethod.POST)
	public int emailChk(MemberDTO param) throws Exception {
		int result = memberService.emailChk(param);
		return result;
	}

	// 닉네임 중복 체크
	@ResponseBody // 비동기 통신 (화면 전환 없이 이루어지는 동작)
	@RequestMapping(value = "nameChk", method = RequestMethod.POST)
	public int nameChk(MemberDTO param) throws Exception {
		int result = memberService.nameChk(param);
		return result;
	}

	// 4. 이메일 인증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(@RequestParam("m_email") String m_email, @RequestParam("m_auth") String m_auth,
			Model model) {
		
		MemberDTO param = new MemberDTO();
		param.setM_auth(m_auth);
		param.setM_email(m_email);
		
		int result = memberService.chckM_auth(param);
		
		switch (result) {
        case 0:
            model.addAttribute("Msg", "인증이 옳바르지 않습니다.");
            break;

        case 1:
            memberService.upM_authstate(param);
            model.addAttribute("Msg", "회원가입한 정보로 로그인 해주세요!");
            break;
    }
		model.addAttribute("Msg", "재로그인 해주세요.");
		return "member/login";

	}
	
	// 회원 정보 수정 화면
		@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
		public String updateMember() {
			return "/member/updateMember";
		}
		
	// 회원 정보 수정
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(MemberDTO param, Model model) {
		model.addAttribute("Msg", "수정된 정보로 로그인 해주세요.");
		memberService.updateMember(param);
		return "/member/login";
	}
	
	 @RequestMapping("/mypage")
	    public String mypage() {
	        return "/member/mypage";
	    }
	 
	 @RequestMapping(value = "/mypage", method = RequestMethod.POST)
	    public String myPageMod(MemberDTO param, Model model) {

	        memberService.updateMember(param);
	        return "/member/mypage";
	    }

	
}
