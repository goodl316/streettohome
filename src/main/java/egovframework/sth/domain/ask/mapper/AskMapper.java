package egovframework.sth.domain.ask.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.ask.domain.AskDTO;

@Mapper
public interface AskMapper {
	
	int insAsk(AskDTO dto);
	

}
