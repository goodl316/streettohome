package egovframework.sth.domain.member.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.member.domain.MemberDTO;

@Mapper
public interface MemberMapper {

	MemberDTO selMember(MemberDTO param);
	
	int insMember(MemberDTO param);
	
	int emailChk(MemberDTO param);
	
	int nameChk(MemberDTO param);

	MemberDTO chckM_auth(MemberDTO param);

	int upM_authstate(MemberDTO param);

	void updateMember(MemberDTO param);
	
}