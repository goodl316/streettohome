package egovframework.sth.domain.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public List<MemberDTO> selMember(MemberDTO dto) {
		return mapper.selMember(dto);
	}
	
	public List<BoardDTO> selBoard(BoardDTO dto){
		return mapper.selBoard(dto);
		}
	
	public int delBoard(BoardDTO dto) {
		return mapper.delBoard(dto);
	}
	
	
	public int delMember(MemberDTO dto) {
		return mapper.delMember(dto);
	}

}