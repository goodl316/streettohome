package egovframework.sth.domain.pay.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.pay.domain.AuctionDTO;
import egovframework.sth.domain.pay.domain.PayDTO;

@Mapper
public interface PayMapper {

	PayDTO selPayInfo(int b_no);
	int selMyMoney(int m_no);
	
	//결제
	int buy(PayDTO param);
	int sell(PayDTO param);
	int boardState(int b_no);
	int insHistory(PayDTO param);
	
	//경매
	List<AuctionDTO> selAuctionList();
	AuctionDTO selAuctionInfo(int b_no);
	int auctionBid(AuctionDTO param);
	int closeAuction(int b_no);
	int buyAuction(AuctionDTO param);
	int sellAuction(AuctionDTO param);
	
}
