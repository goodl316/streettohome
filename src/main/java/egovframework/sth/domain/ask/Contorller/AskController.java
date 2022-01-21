package egovframework.sth.domain.ask.Contorller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.ask.domain.AskDTO;
import egovframework.sth.domain.ask.service.AskService;

@Controller
public class AskController {
	
	@Autowired
	private AskService service;
	
	@GetMapping("/ask/regAsk")
	public void regAsk() {
		
	}
	
	
	@ResponseBody
	@PostMapping("/ask/insAsk")
	public Map<String,Object> insAsk(@RequestBody AskDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.insAsk(dto));
		return val;
	}
	
	
	
	
	
	
	
	
}
