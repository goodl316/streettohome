package egovframework.sth.domain.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.sth.domain.admin.service.AdminService;

@RestController
public class ExcelController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/admin/excel/transaction_history")
	public void excelDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<?> dto = new ArrayList<>();
		dto = service.getHistory();
		service.excelDownload(request, response, "transaction_history", dto);
	}
}
