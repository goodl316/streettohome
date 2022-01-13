package egovframework.sth.domain.member.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.member.domain.MemberDTO;

@Mapper
public interface MemberMapper {

	MemberDTO selMember(MemberDTO param);
	
}
