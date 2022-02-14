package egovframework.sth.domain.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.main.domain.MainVO;
import egovframework.sth.domain.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	

	@GetMapping("/")
	public String main(Model model,MainVO vo ) {
		model.addAttribute("list", service.selMainList(vo));
		model.addAttribute("banner", service.bannerList(vo));
		return "/main";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping("/getBanner") public List<BannerDTO> bannerModImg(Model
	 * model,BannerDTO dto){ return service.bannerList(dto); }
	 */
}
