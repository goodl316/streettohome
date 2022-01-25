package egovframework.sth.domain.ask.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.ask.domain.AskDTO;
import egovframework.sth.domain.ask.mapper.AskMapper;

@Service
public class AskService {
	
	@Autowired
	private AskMapper mapper;
	
	public int insAsk(AskDTO dto) {
		return mapper.insAsk(dto);
	}
	

}
