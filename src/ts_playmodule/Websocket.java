package ts_playmodule;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;;

//@ServerEndpoint는 클라이언트에서 서버로 접속 할 주소로 지정합니다.
//@OnMessage에서는 클라이언트로 부터 메시지가 도착했을때 처리입니다.
//@OnOpen은 클라이언트에서 서버로 접속할 때의 처리입니다.
//@OnClose는 접속이 끊겼을때 처리입니다.

// @ServerEndpoint 어노테이션을 명시함으로서 WEB 소켓으로 접속 가능한 URL 
// 정보를 명시하여 소켓 서버를 생성해주며 프로퍼티를 통해 decoder나 encoder를 명시할 수 있다.
// 싱글톤 패턴이다.
@ServerEndpoint("/websocket")
public class Websocket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		System.out.println("세션 ID : " + session.getId() + ", " + message);
		sendAll(session, message);
		/*
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
		*/
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
	
	public void sendAll(Session session, String message) throws IOException{
		synchronized (clients) {
			for(Session client : clients){
				if(!client.equals(session)){
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
}
