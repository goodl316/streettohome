package egovframework.sth.domain.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.sth.domain.reply.domain.ReplyDTO;
import egovframework.sth.domain.reply.mapper.ReplyMapper;

@Service
public class ReplyService {
	
	@Autowired
	ReplyMapper mapper;
	
	public int insReply(ReplyDTO param) {
		return mapper.insReply(param);
	}
	
	@Transactional
	public int insReReply(ReplyDTO param) {
		mapper.updReReply(param);
		return mapper.insReReply(param);
	}
	
	public List<ReplyDTO> selReply(int b_no) {
		return mapper.selReply(b_no);
	}
	
	public int delReply(ReplyDTO param) {
//		TODO: session으로 확인하기
		System.out.println(param.getR_no());
		return mapper.delReply(param.getR_no());
	}

}
