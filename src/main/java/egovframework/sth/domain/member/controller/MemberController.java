package egovframework.sth.domain.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.sth.domain.board.domain.BoardVO;
import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro() {
		return "/member/intro";
	}
	
	@RequestMapping(value = "/spon", method = RequestMethod.GET)
	public String spon() {
		return "/member/spon";
	}

	// 1. 로그인 화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String openLogin() {
		return "/member/login";
	}

	// 2. 로그인 기능
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO param, Model model) {
		if (memberService.login(param) == 0) {
			model.addAttribute("Msg", "이메일 또는 비밀번호를 확인해주세요.");
			return "/member/login";
		} else {
			return "redirect:/";
		}
	}

	// 3. 로그아웃 기능
	@RequestMapping("/logout")
	public String logout(HttpSession hs, HttpServletRequest req) {
		hs.invalidate(); // 세션 종료
//		String referer = req.getHeader("REFERER");
		return "redirect:/member/login";
	}

	// 2. 회원가입 화면
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}

	// 3. 회원가입 기능
	@ResponseBody
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public Map<String,Object> join(@RequestBody MemberDTO param, Model model) throws MessagingException, UnsupportedEncodingException {
		
		Map<String,Object> val = new HashMap<>();
		val.put("data", memberService.join(param));
		return val;
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
	public String emailConfirm(@RequestParam("m_email") String m_email,
			@RequestParam(value = "m_auth", required = false) String m_auth, Model model) {

		MemberDTO param = new MemberDTO();
		param.setM_auth(m_auth);
		param.setM_email(m_email);

		int result = memberService.chckM_auth(param);

		switch (result) {
		case 0:
			model.addAttribute("Msg", "인증이 옳바르지 않습니다.");
			return "/member/login";

		case 1:
			memberService.upM_authstate(param);
			model.addAttribute("Msg", "회원가입한 정보로 로그인 해주세요!");
			return "/member/login";
		}
		model.addAttribute("Msg", "재로그인 해주세요.");
		return "/member/login";

	}

	// 회원 정보 수정 화면
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public String updateMember(HttpServletRequest req, Model model, MemberDTO param) throws Exception {
		return "/member/updateMember";
	}

	// 회원 정보 수정
	@ResponseBody
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public Map<String,Object> updateMember(@RequestBody MemberDTO param, Model model, HttpSession session) {
		model.addAttribute("Msg", "수정된 정보로 로그인 해주세요.");
		Map<String, Object> map = new HashMap<String, Object>();
		MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
        String m_pw = param.getM_pw();
        member.setM_pw(m_pw);
        session.setAttribute("loginMember", member);
		map.put("result", memberService.updateMember(param));
		return map;
	}

	@RequestMapping("/mypage")
	public String mypage() {
		
		
		return "/member/updateMember";
	}

//	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
//	public String myPageMod(MemberDTO param, Model model) {
//
//		memberService.updateMember(param);
//		return "/member/mypage";
//	}

	/* 비밀번호 찾기 */
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findPwGET() throws Exception{
		return "/member/findpw";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute MemberDTO param, HttpServletResponse response, Model model) throws Exception{
		memberService.findPw(response, param);
	}
	
	/* 이메일 찾기 */
	@RequestMapping(value = "/findemail", method = RequestMethod.GET)
	public String findemailGET() throws Exception{
		return "/member/findemail";
	}

	@RequestMapping(value = "/findemail", method = RequestMethod.POST)
	@ResponseBody
	public void findemailPOST(HttpServletResponse response,@ModelAttribute MemberDTO param, Model model) throws Exception {
		memberService.findemail(response, param);
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDelete() throws Exception{
		return "/member/memberDelete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public int memberDelete(@RequestBody MemberDTO param, HttpSession session, RedirectAttributes rttr) throws Exception {
		if(memberService.memberDelete(param) == 1) {
			session.invalidate();
			return 1;
		} else {
			return 0;
		}
	}
	
	//내 게시글 목록
	@GetMapping("/myboard")
	public String selmyBoard(Model model,BoardVO vo,HttpServletRequest req) {
		PaginationInfo pagination = new PaginationInfo();
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		
		vo.setRecordCountPerPage(pagination.getRecordCountPerPage());
		vo.setFirstIndex(pagination.getFirstRecordIndex());

		pagination.setTotalRecordCount(memberService.countmyBoard(vo));
		
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("list", memberService.myboard(vo));
		model.addAttribute("m_no",vo.getM_no());
		return "/member/myboard";
	}
}
