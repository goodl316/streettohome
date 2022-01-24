package egovframework.sth.domain.admin.controller.banner;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class BannerAdminController {
	@Autowired
	private AdminService service;
	
	
	
	
	
	@GetMapping("/admin/bannerAdmin")
	public void adminBanner() {
		
	}
	
	@PostMapping("/admin/insbanner")
	public Map<String,Object> insbanner(@RequestBody MultipartFile[] imgs, int ba_no){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.bannerimgUpload(imgs, ba_no));
		return val;
	}
}
