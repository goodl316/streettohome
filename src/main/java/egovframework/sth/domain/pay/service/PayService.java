package egovframework.sth.domain.pay.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import egovframework.sth.domain.pay.domain.PayDTO;
import egovframework.sth.domain.pay.mapper.PayMapper;

@Service
public class PayService {

	@Autowired
	PayMapper mapper;
	
	public PayDTO selPayInfo(int b_no) {
		return mapper.selPayInfo(b_no);
	}
	
	public int selMyMoney(int m_no) {
		return mapper.selMyMoney(m_no);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	public int payment(PayDTO param) {
			mapper.insHistory(param);
			mapper.buy(param);
			mapper.sell(param);
			return mapper.boardState();
	}
}
