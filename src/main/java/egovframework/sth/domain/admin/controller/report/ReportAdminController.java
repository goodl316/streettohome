package egovframework.sth.domain.admin.controller.report;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.ReportDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class ReportAdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/ReportAdmin")
	public void reportAdmin(Model model,ReportDTO dto) {
		model.addAttribute("list", service.selReport(dto));
	}
	
	@ResponseBody
	@PostMapping("/admin/delReport")
	public Map<String,Object> delReport(@RequestBody ReportDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delReport(dto));
		
		return val;
	}
	
	@ResponseBody
	@PostMapping("/admin/insReport")
	public Map<String,Object> insReport(ReportDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data",service.insReport(dto));
		return val;
	}
	
}
