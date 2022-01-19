package egovframework.sth.domain.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/MemberAdmin")
	public void userAdmin(Model model,MemberDTO dto) {
		model.addAttribute("list", service.selMember(dto));
		
	}
	
	@GetMapping("/admin/BoardAdmin")
	public void boardAdmin(Model model,BoardDTO dto) {
		model.addAttribute("list", service.selBoard(dto));
	}
	@ResponseBody
	@PostMapping("/admin/delBoard")
	public Map<String,Object> delBoard(@RequestBody BoardDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delBoard(dto));
		return val;
	}
	
	@ResponseBody
	@PostMapping("/admin/delMember")
	public Map<String,Object> delMember(@RequestBody MemberDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delMember(dto));
		return val;
	}
	

}
