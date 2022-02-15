package egovframework.sth.domain.ask.Contorller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.sth.domain.ask.domain.AskDTO;
import egovframework.sth.domain.ask.service.AskService;

@Controller
public class AskController {
	
	@Autowired
	private AskService service;
	
	@GetMapping("/ask/list")
	public String getList(Model model, HttpServletRequest req) {
		PaginationInfo pagination = new PaginationInfo();
		Map<String, Object> map = new HashMap<>();
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		map.put("recordCountPerPage", pagination.getRecordCountPerPage());
		map.put("firstIndex", pagination.getFirstRecordIndex());
		pagination.setTotalRecordCount(service.selAskCount());
		
		model.addAttribute("data", service.selAskList(map));
		model.addAttribute("paginationInfo", pagination);
		return "/ask/list";
	}
	
	@GetMapping("/ask/password")
	public String getPassword() {
		return "/ask/password";
	}
	@GetMapping("/ask/view")
	public String view(Model model, AskDTO param, HttpSession session, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		if(session.getAttribute("ask") != null && (int) session.getAttribute("ask") == service.selAsk(param).get(0).getAk_no()) {
			model.addAttribute("data", service.selAsk(param));
		} else {
			PrintWriter out = res.getWriter();
			out.println("<script>alert('비정상적인 접근입니다.'); location.href='/ask/list?page=1';</script>");
			out.flush();
		}
		return "/ask/view";
	}
	
	@GetMapping("/ask/mod")
	public String openModAsk(Model model, AskDTO param, HttpSession session, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		if(session.getAttribute("ask") != null && (int) session.getAttribute("ask") == service.selAsk(param).get(0).getAk_no()) {
			model.addAttribute("data", service.selAskAdmin(param.getAk_idx()));
		} else {
			PrintWriter out = res.getWriter();
			out.println("<script>alert('비정상적인 접근입니다.'); location.href='/ask/list?page=1';</script>");
			out.flush();
		}
		return "/ask/mod";
	}
	
	@PostMapping("/ask/mod")
	public String modAsk(AskDTO param) {
		service.updAsk(param);
		return "redirect:/ask/list?page=1";
	}
	
	@PostMapping("/ask/view")
	public String checkPassword(HttpSession session, AskDTO param, HttpServletRequest req, HttpServletResponse res, RedirectAttributes redirect) throws IOException, ServletException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		if(service.selAsk(param).get(0).getAk_pw().equals(param.getAk_pw())) {
			session.removeAttribute("ask");
			session.setAttribute("ask", service.selAsk(param).get(0).getAk_no());
			return "redirect:/ask/view?ak_idx=" + param.getAk_idx();
		} else {
			out.println("<script>alert('비밀번호가 다릅니다.'); location.href='/ask/list?page=1';</script>");
			out.flush();
			return null;
		}
	}
	
	@GetMapping("/ask/regAsk")
	public String regAsk() {
		return "/ask/regAsk";
	}
	
	@PostMapping("/ask/insAsk")
	public String insAsk(AskDTO dto){
		service.insAsk(dto);
		return "redirect:/ask/list?page=1";
	}
}
