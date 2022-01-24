package egovframework.sth.global.common.message;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import egovframework.sth.domain.member.domain.MemberDTO;
import egovframework.sth.domain.message.mapper.MessageMapper;

@Component
public class WebSocketHandler extends TextWebSocketHandler{

	@Autowired
	MessageMapper mapper;
	
	private final Logger logger = Logger.getLogger(getClass());
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		int ms_receiver = getMemberNo(session);
		sessionList.add(session);
		session.sendMessage(new TextMessage("ms : " + mapper.selCountMessage(ms_receiver)));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	}
	
	public int getMemberNo(WebSocketSession session) throws Exception {
		MemberDTO member = new MemberDTO();
		Map<String, Object> map = session.getAttributes();
		member = (MemberDTO) map.get("loginMember");
		
		if(member != null) 
		{ return member.getM_no(); }
		return 0;
	}
}
