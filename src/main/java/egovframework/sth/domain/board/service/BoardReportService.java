package egovframework.sth.domain.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.board.domain.BoardReportDTO;
import egovframework.sth.domain.board.mapper.BoardReportMapper;

@Service
public class BoardReportService {
	
	@Autowired
	BoardReportMapper mapper;
	
	public int insReport(BoardReportDTO param) {
		return mapper.insReport(param);
	}
}
