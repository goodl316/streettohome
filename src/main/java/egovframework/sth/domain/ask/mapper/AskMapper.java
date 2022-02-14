package egovframework.sth.domain.ask.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.ask.domain.AskDTO;

@Mapper
public interface AskMapper {
	
	List<AskDTO> selAskList();
	AskDTO selAsk(AskDTO dto);
	int insAsk(AskDTO dto);
	int insAns(AskDTO dto);
	
}
