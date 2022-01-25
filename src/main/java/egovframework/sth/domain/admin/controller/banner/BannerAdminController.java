package egovframework.sth.domain.admin.controller.banner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class BannerAdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/bannerAdmin")
	public void adminBanner() {
		
	}
	@ResponseBody
	@PostMapping("/admin/insbanner")
	public int insbanner(@RequestBody MultipartFile[] imgs){
		System.out.println(imgs.length);
		return service.bannerimgUpload(imgs);
	}
	
	@ResponseBody
	@GetMapping("/bannerModImg")
	public List<BannerDTO> bannerModImg(BannerDTO dto){
		return service.bannerList(dto);
	}
	@ResponseBody
	@PostMapping("/admin/delimg")
	public Map<String,Object> delimg(@RequestBody BannerDTO dto) {
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.selinfo(dto));
		return val;
	}
}
