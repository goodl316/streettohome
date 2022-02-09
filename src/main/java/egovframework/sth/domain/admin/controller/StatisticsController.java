package egovframework.sth.domain.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.StatisticsDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class StatisticsController {
	
	@Autowired
	AdminService service;

	@GetMapping("/admin/statistics")
	public void openStatistics() {}
	
	@ResponseBody
	@GetMapping("/admin/statistics/board") 
	public Map<String, StatisticsDTO> getBoard() {
		Map<String, StatisticsDTO> map = new HashMap<>();
		map.put("data", service.selBoardStatistics());
		return map;
	}
	@ResponseBody
	@GetMapping("/admin/statistics/reply") 
	public Map<String, StatisticsDTO> getReply() {
		Map<String, StatisticsDTO> map = new HashMap<>();
		map.put("data", service.selReplyStatistics());
		return map;
	}
	@ResponseBody
	@GetMapping("/admin/statistics/tranhis") 
	public Map<String, StatisticsDTO> getTransactionHistory() {
		Map<String, StatisticsDTO> map = new HashMap<>();
		map.put("data", service.selTranHisStatistics());
		return map;
	}
	@ResponseBody
	@GetMapping("/admin/statistics/sales") 
	public Map<String, StatisticsDTO> getSales() {
		Map<String, StatisticsDTO> map = new HashMap<>();
		map.put("data", service.selSalesStatistics());
		return map;
	}
}
