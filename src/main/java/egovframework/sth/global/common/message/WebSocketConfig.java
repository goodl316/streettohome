package egovframework.sth.global.common.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	@Autowired
	private WebSocketHandler handler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(handler, "/echo")
		.setAllowedOrigins("*")
		.withSockJS()
		.setClientLibraryUrl("https://cdn.jsdelivr.net/sockjs/latest/sockjs.min.js")
		.setInterceptors(new HttpSessionHandshakeInterceptor());
	}

}
