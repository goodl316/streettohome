package egovframework.sth.domain.message.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.message.domain.MessageDTO;

@Mapper
public interface MessageMapper {
	
	List<MessageDTO> selMessageList(Map<String, Object> map);
	int selCountMessage(int ms_receiver);
	int insMessage(MessageDTO param);
	int delMessage(MessageDTO ms_no);
	int selCountTotalMessage(Map<String, Object> map);
	MessageDTO selMessage(MessageDTO param); 
	int readMessage(MessageDTO param);
	String getNickname(int ms_receiver);
}
