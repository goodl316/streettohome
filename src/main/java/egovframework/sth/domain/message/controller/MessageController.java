package egovframework.sth.domain.message.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.message.domain.MessageDTO;
import egovframework.sth.domain.message.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	MessageService service;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/member/message")
	public String getReceiveMessageList(Model model, HttpServletRequest req,
			@RequestParam(value = "ms_receiver", defaultValue = "0") int ms_receiver,
			@RequestParam(value = "ms_sender", defaultValue = "0") int ms_sender) {
		Map<String, Object> map = new HashMap<>();
		PaginationInfo pagination = new PaginationInfo();
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		if(member.getM_no() != ms_receiver && member.getM_no() != ms_sender) {
			model.addAttribute("msg", "비정상적인 접근입니다.");
			return "redirect:/temp/error";
		}
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		
		map.put("recordCountPerPage", pagination.getRecordCountPerPage());
		map.put("firstIndex", pagination.getFirstRecordIndex());
		map.put("ms_receiver", ms_receiver);
		map.put("ms_sender", ms_sender);
		pagination.setTotalRecordCount(service.selCountTotalMessage(map));
		model.addAttribute("data", service.selMessageList(map));
		model.addAttribute("paginationInfo", pagination);
		return "/member/message";
	}
	
	@GetMapping("/member/message/view")
	public String getMessageView(Model model, MessageDTO param) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		MessageDTO msg = service.selMessage(param);
		if(member.getM_no() != msg.getMs_receiver() && member.getM_no() != msg.getMs_sender()) {
			return "redirect:/member/message?page=1&ms_receiver=" + member.getM_no();
		}
		int[] array = new int[1];
		array[0] = param.getMs_no();
		param.setCheckVal(array);
		
		if(member.getM_no() == msg.getMs_receiver()) {
			service.readMessage(param);
		}
		model.addAttribute("data", service.selMessage(param));
		return "/popup/messageView";
	}
	
	@ResponseBody
	@DeleteMapping("/member/message")
	public int delMessage(@RequestBody MessageDTO param) {
		return service.delMessgae(param);
	}
	
	@ResponseBody
	@PatchMapping("/member/message")
	public int readMessage(@RequestBody MessageDTO param) {
		return service.readMessage(param);
	}
	
	@GetMapping("/member/message/write")
	public String getWriteMessage(Model model, @RequestParam(value = "ms_receiver", defaultValue = "0") int ms_receiver) {
		if(ms_receiver == 0) {
			model.addAttribute("msg", "비정상적인 접근입니다.");
			return "redirect:/temp/error";
		}
		model.addAttribute("nickname", service.getNickname(ms_receiver));
		return "/popup/messageWrite";
	}
	
	@ResponseBody
	@PostMapping("/member/message")
	public int sendMessage(@RequestBody MessageDTO param) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		param.setMs_sender(member.getM_no());
		return service.insMessage(param);
	}
}
