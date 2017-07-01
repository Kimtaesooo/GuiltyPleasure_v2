package dao.ts_battlemodule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import dto.Battle_Play;

@ServerEndpoint("/battlesocket")
public class Websocket {
	static HashMap<String, Session> map = new HashMap<String, Session>();
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	String me ="";
	String br_num ="";
	String user01="";
	String user02="";
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		
		// 받아온 텍스트 문자열로 분리
		String strArray[] = message.split(":");
		
		/*
		if (strArray[0].equals("messageSend")) {
			synchronized (clients) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}
		*/
		
		if (strArray[0].equals("messageSend")) {
			synchronized (clients) {
				for (Session client : clients) {
					if (!client.equals(session)){
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}

		
		if (strArray[0].equals("sessionValue")){
			// 0-sessionValue, 1-방번호, 2-u_id
			me = strArray[2];
			map.put(me, session);
			Session usersession = map.get(me);
		}
		
		if (strArray[0].equals("gameStart")){
			// gameStart:"+ br_num+":"+me
			br_num = strArray[1];
			message = "게임이 곧 시작됩니다.:"+br_num;
			me = strArray[2];
			for (Session client : clients) {
					client.getBasicRemote().sendText(message);
			}
			
			
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}
