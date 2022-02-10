package egovframework.sth.domain.admin.controller.board;

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

import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.service.AdminService;

@Controller
public class BoardAdminController {
	
	@Autowired
	private AdminService service;
	
	
	@GetMapping("/admin/BoardAdmin")
	public void boardAdmin(Model model, HttpServletRequest req) {
		PaginationInfo pagination = new PaginationInfo();
		Map<String, Object> map = new HashMap<>();
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		
		map.put("recordCountPerPage", pagination.getRecordCountPerPage());
		map.put("firstIndex", pagination.getFirstRecordIndex());
		map.put("an_type1", req.getParameter("an_type1"));
		map.put("m_name", req.getParameter("m_name"));
		map.put("b_auth", req.getParameter("b_auth"));
		
		
		pagination.setTotalRecordCount(service.selCountBoard(map));
		
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("list", service.selBoard(map));
	}
	
	@GetMapping("/admin/delBoardAdmin")
	public void delBoardAdmin(Model model, HttpServletRequest req) {
		System.out.println("Asdasd");
		PaginationInfo pagination = new PaginationInfo();
		Map<String, Object> map = new HashMap<>();
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		
		map.put("recordCountPerPage", pagination.getRecordCountPerPage());
		map.put("firstIndex", pagination.getFirstRecordIndex());
		map.put("m_name", req.getParameter("m_name"));
		pagination.setTotalRecordCount(service.selCountDelBoard(map));
		
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("list", service.delBoardList(map));
		
	}
	
	@ResponseBody
	@PostMapping("/admin/delBoard")
	public Map<String,Object> delBoard(@RequestBody BoardDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.delBoard(dto));
		return val;
	}
	
	@ResponseBody
	@PostMapping("/admin/boardOk")
	public Map<String,Object> boardOk(@RequestBody BoardDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.okBoard(dto));
		return val;
	}
	
}
