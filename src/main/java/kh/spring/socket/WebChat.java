package kh.spring.socket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint(value="/WebSocket",configurator=HttpSessionSetter.class)
public class WebChat {
	private static Set<Session> clients=Collections.synchronizedSet(new HashSet<Session>()); //클라이언트

	private String id;
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception {
		for(Session each:clients) {
			/*if(each ==session)*/
			System.out.println(session);
			System.out.println(msg);
			each.getBasicRemote().sendText(id+"님의 메시지 :"+msg);
		}

	}
	@OnOpen
	public void onOpen(Session session,EndpointConfig ec) {
		HttpSession hsession=(HttpSession)ec.getUserProperties().get("httpSession");
		/*hsession.getAttribute("loginDTO");*/
		
		id=(String) hsession.getAttribute("id");
		System.out.println(hsession.getAttribute("id"));
		System.out.println("접속");
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session)
	{
		clients.remove(session);
	}


















}
