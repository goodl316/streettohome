package egovframework.sth.domain.admin.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.domain.ReportDTO;
import egovframework.sth.domain.admin.domain.ReportVO;

@Mapper
public interface AdminMapper {

	List<MemberDTO> selMember(MemberDTO dto);
	List<BoardDTO> selBoard(BoardDTO dto);
	List<ReportVO> selReport(ReportDTO dto);
	int delBoard(BoardDTO dto);
	int delMember(MemberDTO dto);
	int insReport(ReportDTO dto);
}
