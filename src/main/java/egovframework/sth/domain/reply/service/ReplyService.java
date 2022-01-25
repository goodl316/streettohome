package egovframework.sth.domain.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.reply.domain.ReplyDTO;
import egovframework.sth.domain.reply.mapper.ReplyMapper;

@Service
public class ReplyService {
	
	@Autowired
	ReplyMapper mapper;
	
	@Autowired
	HttpSession session;
	
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
		MemberDTO login = (MemberDTO) session.getAttribute("loginMember");
		
		if(login.getM_no() == param.getM_no() || login.getM_authstate() == 999) {
			return mapper.delReply(param);
		}
		return 0;
	}

}
