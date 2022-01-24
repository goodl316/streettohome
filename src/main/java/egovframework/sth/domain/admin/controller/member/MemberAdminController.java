package egovframework.sth.domain.admin.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.service.AdminService;
@Controller
public class MemberAdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/MemberAdmin")
	public void userAdmin(Model model,MemberDTO dto) {
		model.addAttribute("list", service.selMember(dto));
		
	}
	
	@ResponseBody
	@PostMapping("/admin/delMember")
	public Map<String,Object> delMember(@RequestBody MemberDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delMember(dto));
		return val;
	}

}
