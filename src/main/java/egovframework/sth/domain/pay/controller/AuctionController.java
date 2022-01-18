package egovframework.sth.domain.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import egovframework.sth.domain.pay.service.AuctionService;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionService service;
}
