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
	
	public List<AskDTO> selAsk(AskDTO param) {
		return mapper.selAsk(param);
	}
	
	public AskDTO selAskAdmin(int ak_no) {
		return mapper.selAskAdmin(ak_no);
	}
	
	public int insAsk(AskDTO dto) {
		return mapper.insAsk(dto);
	}
	
	public int insAns(AskDTO dto) {
		return mapper.insAns(dto);
	}
	
	public int delAsk(int ak_no) {
		return mapper.delAsk(ak_no);
	}
	
	public int updAns(AskDTO param) {
		return mapper.updAns(param);
	}
	
	public int updAsk(AskDTO param) {
		return mapper.updAsk(param);
	}
}
