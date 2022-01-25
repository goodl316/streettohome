package egovframework.sth.domain.message.service;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.message.domain.MessageDTO;
import egovframework.sth.domain.message.mapper.MessageMapper;

@Service
public class MessageService {
	
	@Autowired
	MessageMapper mapper;
	
	public List<MessageDTO> selMessageList(Map<String, Object> map) {
		return mapper.selMessageList(map);
	}
	
	public int selCountTotalMessage(Map<String, Object> map) {
		return mapper.selCountTotalMessage(map);
	}
	
	public MessageDTO selMessage(MessageDTO param) {
		return mapper.selMessage(param);
	}
	
	public int readMessage(MessageDTO param) {
		return mapper.readMessage(param);
	}
	
	public int delMessgae(MessageDTO param) {
		return mapper.delMessage(param);
	}
	
	public String getNickname(int ms_receiver) {
		return mapper.getNickname(ms_receiver);
	}
	public int insMessage(MessageDTO param) {
		return mapper.insMessage(param);
	}
}
