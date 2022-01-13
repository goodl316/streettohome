package egovframework.sth.domain.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.member.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private HttpSession session;
	
	public String login(MemberDTO param) {
		
		MemberDTO result = mapper.selMember(param);
		
		if (mapper.selMember(param) == null) {
			return "login";
		} else {
		   session.setAttribute("loginMember", result);
		   return "/main";
		}
		
	}
	
}
