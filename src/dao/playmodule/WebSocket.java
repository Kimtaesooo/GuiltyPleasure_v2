package dao.playmodule;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocket {
	
	//웹 소켓 연결시 호출되는 이벤트
	@OnOpen
	public void handleOpen(){
		System.out.println("클라이언트 연결");
	}
	//웹소켓으로 부터 메시지가 오면 호출되는 이벤트
	
	@OnMessage
	public String handleMessage(String message){
		System.out.println("클라이언트로 부터 받은 메세지 :" + message);
		String replymessage = "유저1" + message;
		System.out.println("클라이언트에게 보내는 메세지" + replymessage);
		return replymessage;
	}
	
	//웹소켓이 닫히면 호출되는 이벤트
	@OnClose
	public void handleClose(){
		System.out.println("클라이언트 접속 끊김");
	}
	
	//웹 소켓이 에러가 나면 호출되는 이벤트
	@OnError
	public void handleError(Throwable t){
		t.printStackTrace();
	}
}
