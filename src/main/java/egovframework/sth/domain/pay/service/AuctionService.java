package egovframework.sth.domain.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.pay.mapper.AuctionMapper;

@Service
public class AuctionService {
	
	@Autowired
	AuctionMapper mapper;
	

}
