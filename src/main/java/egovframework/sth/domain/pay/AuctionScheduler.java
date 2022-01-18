package egovframework.sth.domain.pay;

import java.util.Timer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.sth.domain.pay.mapper.AuctionMapper;

@Component
public class AuctionScheduler {
	
	private static final Logger logger = LoggerFactory.getLogger(AuctionScheduler.class);

	@Autowired
	private AuctionMapper mapper;
	
	public void closeAuction() {
		Timer timer = new Timer();
		timer.s
	}
	
}
