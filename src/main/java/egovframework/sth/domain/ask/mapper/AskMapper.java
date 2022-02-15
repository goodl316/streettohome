package egovframework.sth.domain.ask.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.ask.domain.AskDTO;

@Mapper
public interface AskMapper {
	
	List<AskDTO> selAskList(Map<String, Object> param);
	List<AskDTO> selAsk(AskDTO dto);
	AskDTO selAskAdmin(int ak_no);
	int insAsk(AskDTO dto);
	int insAns(AskDTO dto);
	int delAsk(int ak_no);
	int updAns(AskDTO param);
	int updAsk(AskDTO param);
	int selAskCount();
}
