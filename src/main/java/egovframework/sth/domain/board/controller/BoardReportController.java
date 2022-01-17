package egovframework.sth.domain.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.sth.domain.board.domain.BoardReportDTO;
import egovframework.sth.domain.board.service.BoardReportService;

@Controller
public class BoardReportController {
	
	@Autowired
	BoardReportService service;

	@GetMapping("/report")
	public String report() {
		return "popup/report";
	}
	
	@PostMapping("/report")
	public Map<String, Integer> insReport(BoardReportDTO param) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", service.insReport(param));
		return map;
	}
	
}
