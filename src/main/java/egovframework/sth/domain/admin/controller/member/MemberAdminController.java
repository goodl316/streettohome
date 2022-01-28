package egovframework.sth.domain.admin.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.service.AdminService;
@Controller
public class MemberAdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/MemberAdmin")
	public void userAdmin(Model model, HttpServletRequest req) {
		PaginationInfo pagination = new PaginationInfo();
		Map<String, Object> map = new HashMap<>();
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		
		map.put("recordCountPerPage", pagination.getRecordCountPerPage());
		map.put("firstIndex", pagination.getFirstRecordIndex());
		map.put("m_state", req.getParameter("m_state"));
		pagination.setTotalRecordCount(service.selCountMember(map));
		
		model.addAttribute("list", service.selMember(map));
		model.addAttribute("paginationInfo", pagination);
		
	}
	
	@ResponseBody
	@PostMapping("/admin/delMember")
	public Map<String,Object> delMember(@RequestBody MemberDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delMember(dto));
		return val;
	}

}
