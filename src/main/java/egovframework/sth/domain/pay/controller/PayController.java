package egovframework.sth.domain.pay.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.pay.domain.AuctionDTO;
import egovframework.sth.domain.pay.domain.PayDTO;
import egovframework.sth.domain.pay.service.PayService;

@Controller
public class PayController {
	
	@Autowired
	PayService service;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/pay")
	public String pay() {
		MemberDTO dto = new MemberDTO();
		//TODO: 임시 session 삭제하기
		dto.setM_no(1);
		session.setAttribute("loginMember", dto);
		return "/popup/pay";
	}
	
	@GetMapping("/member/sthpay/{idx}")
	public String openMemberPay(@PathVariable int idx, Model model, HttpServletRequest req) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		PaginationInfo pagination = new PaginationInfo();
		
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		
		map.put("recordCountPerPage", pagination.getRecordCountPerPage());
		map.put("firstIndex", pagination.getFirstRecordIndex());
		map.put("idx", idx);
		pagination.setTotalRecordCount(service.selCountList(map));
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("history", service.getHistory(idx, member.getM_no()));
		return "/member/sthpay";
	}
	
	@ResponseBody
	@GetMapping("/pay/info/{b_no}")
	public Map<String, PayDTO> getBoardInfo(@PathVariable int b_no) {
		Map<String, PayDTO> map = new HashMap<>();
		map.put("data", service.selPayInfo(b_no));
		return map;
	}
	
	@ResponseBody
	@GetMapping("/pay/myinfo/{m_no}")
	public Map<String, Integer> getMyInfo(@PathVariable int m_no) {
		Map<String, Integer> map = new HashMap<>();
		map.put("myInfo", service.selMyMoney(m_no));
		return map;
	}
	
	@ResponseBody
	@PostMapping("/pay")
	public Map<String, Integer> payment(@RequestBody PayDTO param) {
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.payment(param));
		return map;
	}
	
	@GetMapping("/auction")
	public String auction() {
		return "/popup/auction";
	}
	
	@ResponseBody
	@GetMapping("/auction/info/{b_no}")
	public Map<String, AuctionDTO> getAuctionInfo(@PathVariable int b_no) {
		Map<String, AuctionDTO> map = new HashMap<>();
		map.put("data", service.selAuctionInfo(b_no));
		return map;
	}
	
	@ResponseBody
	@PostMapping("/auction")
	public Map<String, Integer> auctionBid(@RequestBody AuctionDTO param) {
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.auctionBid(param));
		return map;
	}
	
	@ResponseBody
	@PostMapping("/pay/charge")
	public Map<String, Integer> chargeMoney(@RequestBody PayDTO param) {
		Map<String, Integer> map = new HashMap<>();
		map.put("result", service.chargeMoney(param));
		return map;
	}
}
