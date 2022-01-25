package egovframework.sth.domain.pay.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.pay.domain.AuctionDTO;
import egovframework.sth.domain.pay.domain.PayDTO;
import egovframework.sth.domain.pay.domain.TranHistoryDTO;
import egovframework.sth.domain.pay.mapper.PayMapper;

@Service
public class PayService {

	@Autowired
	PayMapper mapper;
	
	@Autowired
	HttpSession session;
	
	public PayDTO selPayInfo(int b_no) {
		return mapper.selPayInfo(b_no);
	}
	
	public int selMyMoney(int m_no) {
		return mapper.selMyMoney(m_no);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	public int payment(PayDTO param) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		if(member.getM_no() != param.getBuyer()) { return 0; }
		mapper.insHistory(param);
		mapper.buy(param);
		mapper.sell(param);
		return mapper.boardState(param.getB_no());
	}
	
	public AuctionDTO selAuctionInfo(int b_no) {
		return mapper.selAuctionInfo(b_no);
	}
	
	public int auctionBid(AuctionDTO param) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		if(member.getM_no() != param.getAc_cur_winner()) { return 0; }
		return mapper.auctionBid(param);
	}
	
	public List<TranHistoryDTO> getHistory(int idx, int m_no) {
		if(idx == 0) {
			return mapper.buyHistoryList(m_no);
		} else {
			return mapper.sellHistoryList(m_no);
		}
	}
	
	public int selCountList(Map<String, Object> param) {
		return mapper.selCountList(param);
	}
	
	public int chargeMoney(PayDTO param) {
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		param.setM_no(member.getM_no());
		return mapper.chargeMoney(param);
	}
	
}
