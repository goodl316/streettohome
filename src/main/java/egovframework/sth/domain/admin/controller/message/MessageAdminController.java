package egovframework.sth.domain.admin.controller.message;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.AdminMessageDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class MessageAdminController {
	
	@Autowired
	AdminService service;

	@GetMapping("/admin/MessageAdmin")
	public void adminMessage() {}

	@ResponseBody
	@GetMapping("/admin/message/nickname")
	public Map<String, String[]> autoComplete() {
		Map<String, String[]> map = new HashMap<>();
		map.put("nickname", service.autoComplete());
		return map;
	}
	
	@ResponseBody
	@PostMapping("/admin/MessageAdmin")
	public int sendMessage(@RequestBody AdminMessageDTO param) {
		return service.sendAllMessage(param);
	}
}
