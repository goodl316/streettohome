package egovframework.sth.domain.ask.Contorller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.sth.domain.ask.domain.AskDTO;
import egovframework.sth.domain.ask.service.AskService;

@Controller
public class AskController {
	
	@Autowired
	private AskService service;
	
	@GetMapping("/ask/list")
	public void getList(Model model) {
		model.addAttribute("data", service.selAskList());
	}
	
	@GetMapping("/ask/password")
	public void getPassword() {
	}
	
	@GetMapping("/ask/view")
	public String getView() {
		return "/ask/view";
	}
	
	@PostMapping("/ask/view")
	public String checkPassword(AskDTO param, HttpServletRequest req, HttpServletResponse res, RedirectAttributes redirect) throws IOException, ServletException {
		if(service.selAsk(param).get(0).getAk_pw().equals(param.getAk_pw())) {
			redirect.addFlashAttribute("data",service.selAsk(param));
			return "redirect:/ask/view/";
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('비밀번호가 다릅니다.'); location.href='/ask/list';</script>");
			out.flush();
			return null;
		}
	}
	
	@GetMapping("/ask/regAsk")
	public void regAsk() {
		
	}
	
	@PostMapping("/ask/insAsk")
	public String insAsk(AskDTO dto){
		service.insAsk(dto);
		return "redirect:/ask/list";
	}
	
	
	
	
	
	
	
	
}
