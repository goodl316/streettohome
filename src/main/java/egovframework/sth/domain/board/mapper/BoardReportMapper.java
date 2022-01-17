package egovframework.sth.domain.board.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.board.domain.BoardReportDTO;

@Mapper
public interface BoardReportMapper {
	int insReport(BoardReportDTO param);
}
