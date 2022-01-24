package egovframework.sth.domain.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.sth.domain.main.domain.MainVO;
import egovframework.sth.domain.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	


	@GetMapping("/main")
	public void main(Model model,MainVO vo ) {
		model.addAttribute("list", service.selMainList(vo));
		
	}
}
