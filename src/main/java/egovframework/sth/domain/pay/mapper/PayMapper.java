package egovframework.sth.domain.pay.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.pay.domain.PayDTO;

@Mapper
public interface PayMapper {

	PayDTO selPayInfo(int b_no);
	int selMyMoney(int m_no);
	
	//결제
	int buy(PayDTO param);
	int sell(PayDTO param);
	int boardState();
	int insHistory(PayDTO param);
}
