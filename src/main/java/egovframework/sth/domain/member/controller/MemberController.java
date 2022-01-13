package egovframework.sth.domain.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.service.MemberService;

@Controller
@RequestMapping("/member") // 모든 맵핑은 /member/를 상속
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
		    public String login(MemberDTO param) {
		    return "redirect:" + memberService.login(param);
		    }
		 
		// 3. 로그아웃 기능
		 @RequestMapping("/logout")
		 public String logout(HttpSession hs, HttpServletRequest req) {
			 hs.invalidate(); // 세션 종료
			 String referer = req.getHeader("REFERER");
			 return "redirect:"+referer;
		 }
		 
		 

}
