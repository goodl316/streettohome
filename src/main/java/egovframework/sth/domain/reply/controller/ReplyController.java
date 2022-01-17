package egovframework.sth.domain.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.sth.domain.reply.domain.ReplyDTO;
import egovframework.sth.domain.reply.service.ReplyService;

@RestController
@RequestMapping("/board")
public class ReplyController {
	
	@Autowired
	ReplyService service;
	
	@PostMapping("/reply/{check}")
	public Map<String, String> insReply(@RequestBody ReplyDTO param, @PathVariable int check) {
		Map<String, String> map = new HashMap<>();
		int result = 0;
		String msg = "fail";
		if(check == 0) {
			result = service.insReply(param);
		} else {
			result = service.insReReply(param);
		}
		
		if (result != 0) {
			msg = "success";
		}
		map.put("result", msg);
		
		return map;
	}
	
	@GetMapping("/reply/{b_no}")
	public Map<String, List<ReplyDTO>> selReply(@PathVariable int b_no) {
		Map<String, List<ReplyDTO>> map = new HashMap<String, List<ReplyDTO>>();
		map.put("data", service.selReply(b_no));
		
		return map;
	}
	
	@DeleteMapping("/reply")
	public Map<String, String> delReply(@RequestBody ReplyDTO param) {
		Map<String, String> map = new HashMap<String, String>();
		String msg = "fail";
		if(service.delReply(param) != 0) {
			msg = "success";
		}
		map.put("result", msg);
		
		return map;
	}
	
	

}
