package egovframework.sth.domain.admin.controller.ask;

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
import egovframework.sth.domain.admin.service.AdminService;
@Controller
public class AskAdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/AskAdmin")
	public void askAdmin(Model model,AskDTO dto) {
		model.addAttribute("list", service.selAskList(dto));
	}
	
	@GetMapping("/admin/detailAsk")
	public void detailAsk(Model model,AskDTO dto) {
		model.addAttribute("data", service.selAsk(dto));
	}
	
	
	@ResponseBody
	@PostMapping("/admin/delAsk")
	public Map<String,Object> delAsk(@RequestBody AskDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delAsk(dto));
		return val;
	}
}
