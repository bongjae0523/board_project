package org.zerock.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@ServerEndpoint(value="/echo.do")
@Log4j
public class WebSocketChat {

	private static final List<Session> sessionList = new ArrayList<Session>();

	public WebSocketChat() {
		log.info("웹소켓(서버) 객체생성");
	}
	
	@OnOpen
	public void onOpen(Session session) {
		log.info("Open session id: " + session.getId());

		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("대화방에 연결 되었습니다.");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.info(e.getMessage());
		}
		
		sessionList.add(session);
		
	}
	
	/*
	 * 모든 사용자에게 메시지를 전달한다.
	 * @param self
	 * @param sender
	 * @param message
	 */
	
	private void sendAllSessionToMessage(Session self, String sender, String message) {
		
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(sender + ":" + message);
				} 
			}
		}catch (IOException e) {
			// TODO Auto-generated catch block
			log.info(e.getMessage());
				
		}
	}
				
	
	/*
	 * 내가 입력하는 메세지
	 * @parammessage
	 * @param session
	 */
	
	@OnMessage
	public void onMessage(String message, Session session) {
		
		String sender = message.split(",")[1];
		message = message.split(",")[0];
		
		log.info("Message From :" + sender + ": " + message);
		
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("<나> : " + message);
		}catch (Exception e) {
			// TODO: handle exception
			log.info(e.getMessage());
		}
		
		sendAllSessionToMessage(session, sender, message);
		
	}
		
	@OnError
	public void onError(Throwable e, Session session) {
		
	}
	
	
	@OnClose
	public void onClose(Session session) {
		log.info("Session " + session.getId() + " has ended");
		sessionList.remove(session);
	}
		
	
}

