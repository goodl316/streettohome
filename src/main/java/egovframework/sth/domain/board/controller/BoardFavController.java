package egovframework.sth.domain.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.board.domain.BoardFavDTO;
import egovframework.sth.domain.board.service.BoardFavService;
import egovframework.sth.domain.member.domain.MemberDTO;

@Controller
public class BoardFavController {
	
	@Autowired
	BoardFavService service;
	
	@Autowired
	HttpSession session;
	
	@ResponseBody
	@PostMapping("/board/fav")
	public Map<String, Integer> insFav(@RequestBody BoardFavDTO param) {
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.insFav(param));
		return map;
	}

	@ResponseBody
	@GetMapping("/board/fav")
	public Map<String, BoardFavDTO> selFav(BoardFavDTO param) {
		Map<String, BoardFavDTO> map = new HashMap<>();
		map.put("result", service.selFav(param));
		return map;
	}
	
	@GetMapping("/member/favlist")
	public String selFavList(BoardFavDTO param, Model model) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		param.setM_no(member.getM_no());
		model.addAttribute("data", service.selFavList(param));
		return "/member/favlist";
	}
	
	@ResponseBody
	@DeleteMapping("/board/fav")
	public Map<String, Integer> delFav(@RequestBody BoardFavDTO param) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		param.setM_no(member.getM_no());
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.delFav(param));
		
		return map;
	}
}
