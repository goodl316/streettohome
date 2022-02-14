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
	
	public List<AskDTO> selAskList() {
		return mapper.selAskList();
	}
	
	public AskDTO selAsk(AskDTO param) {
		return mapper.selAsk(param);
	}
	
	public int insAsk(AskDTO dto) {
		return mapper.insAsk(dto);
	}
	
	public int insAns(AskDTO dto) {
		return mapper.insAns(dto);
	}
}
