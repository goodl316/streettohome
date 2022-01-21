package egovframework.sth.domain.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.AskDTO;
import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.domain.ReportDTO;
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
	
	@GetMapping("/admin/ReportAdmin")
	public void reportAdmin(Model model,ReportDTO dto) {
		model.addAttribute("list", service.selReport(dto));
	}
	
	@GetMapping("/admin/AskAdmin")
	public void askAdmin(Model model,AskDTO dto) {
		model.addAttribute("list", service.selAskList(dto));
	}
	
	@GetMapping("/admin/detailAsk")
	public void detailAsk(Model model,AskDTO dto) {
		model.addAttribute("data", service.selAsk(dto));
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
	
	@ResponseBody
	@PostMapping("/admin/insReport")
	public Map<String,Object> insReport(ReportDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data",service.insReport(dto));
		return val;
	}
	
	@ResponseBody
	@PostMapping("/admin/delAsk")
	public Map<String,Object> delAsk(@RequestBody AskDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delAsk(dto));
		return val;
	}

}
