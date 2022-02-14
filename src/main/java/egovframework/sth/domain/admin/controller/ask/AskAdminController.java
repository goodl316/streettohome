package egovframework.sth.domain.admin.controller.ask;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.sth.domain.ask.domain.AskDTO;
import egovframework.sth.domain.ask.service.AskService;

@Controller
public class AskAdminController {
	@Autowired
	private AskService service;
	
	@GetMapping("/admin/AskAdmin")
	public void askAdmin(Model model) {
		model.addAttribute("list", service.selAskList());
	}
	
	@GetMapping("/admin/detailAsk")
	public String detailAsk(Model model, int ak_no) {
		model.addAttribute("data", service.selAskAdmin(ak_no));
		return "/popup/ask";
	}
	
	@DeleteMapping("/admin/delAsk/{ak_no}")
	public Map<String, Integer> delAsk(@PathVariable int ak_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("data", service.delAsk(ak_no));
		return map;
	}
	
	@PostMapping("/admin/ans")
	public void insAnswer(AskDTO param, HttpServletResponse res, HttpServletRequest req) throws IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println(req.getParameter("ak_ctnt"));
		service.insAns(param);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('작성완료.'); window.close();</script>");
		out.flush();
	}
	
	@GetMapping("/admin/ask/mod")
	public String openModAnswer(Model model, int ak_no) {
		model.addAttribute("data", service.selAskAdmin(ak_no));
		return "/popup/modask";
	}
	
	@PostMapping("/admin/ask/mod")
	public void modAnswer(AskDTO param) {
		service.updAns(param);
	}
}
