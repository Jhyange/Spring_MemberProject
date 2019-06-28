package kh.spring.socket;

import javax.net.ssl.HandshakeCompletedEvent;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

import org.springframework.stereotype.Component;
@Component
public class HttpSessionSetter extends ServerEndpointConfig.Configurator {

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession hsession=(HttpSession) request.getHttpSession();
		sec.getUserProperties().put("httpSession", hsession);
		// TODO Auto-generated method stub
		super.modifyHandshake(sec, request, response);
	}
	
}
