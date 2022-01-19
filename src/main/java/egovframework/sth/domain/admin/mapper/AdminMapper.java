package egovframework.sth.domain.admin.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;

@Mapper
public interface AdminMapper {

	List<MemberDTO> selMember(MemberDTO dto);
	List<BoardDTO> selBoard(BoardDTO dto);
	int delBoard(BoardDTO dto);
	int delMember(MemberDTO dto);

}
