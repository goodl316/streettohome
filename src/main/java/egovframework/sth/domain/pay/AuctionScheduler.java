package egovframework.sth.domain.pay;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import egovframework.sth.domain.pay.domain.AuctionDTO;
import egovframework.sth.domain.pay.domain.PayDTO;
import egovframework.sth.domain.pay.mapper.PayMapper;

@Component
public class AuctionScheduler {
	
	@Autowired
	PayMapper mapper;
	
	@Transactional(rollbackFor = {Exception.class})
	@Scheduled(cron = "0 0 * * * ?")
	public void closeAuction() throws Exception {
		List<AuctionDTO> list = mapper.selAuctionList();
		
		Date date = new Date(System.currentTimeMillis());
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		String curTime = format.format(date);
		for(int i=0; i<list.size(); i++) {
			
			int b_no = list.get(i).getB_no();
			int compare = curTime.compareTo(list.get(i).getAc_enddt());
			
			if(compare >= 0) {
				AuctionDTO param = list.get(i);
				PayDTO param2 = new PayDTO();
				param2.setB_no(b_no);
				param2.setBuyer(list.get(i).getAc_cur_winner());
				
				mapper.insHistory(param2);
				mapper.closeAuction(b_no);
				mapper.boardState(b_no);
				mapper.buyAuction(param);
				mapper.sellAuction(param);
			}
		}
	}
}
	
