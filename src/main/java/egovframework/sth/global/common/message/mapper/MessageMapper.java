package egovframework.sth.global.common.message.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.global.common.message.domain.MessageDTO;

@Mapper
public interface MessageMapper {
	
	List<MessageDTO> selMessageList(int ms_receiver);
	int selCountMessage(int ms_receiver);
	int insMessage(MessageDTO param);
	int delMessage(MessageDTO param);

}
