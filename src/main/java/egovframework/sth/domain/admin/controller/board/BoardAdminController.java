package egovframework.sth.domain.admin.controller.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class BoardAdminController {
	
	@Autowired
	private AdminService service;
	
	
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
}
