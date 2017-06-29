package ts_playmodule;
import java.io.*;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


//@ServerEndpoint는 클라이언트에서 서버로 접속 할 주소로 지정합니다.
//@OnMessage에서는 클라이언트로 부터 메시지가 도착했을때 처리입니다.
//@OnOpen은 클라이언트에서 서버로 접속할 때의 처리입니다.
//@OnClose는 접속이 끊겼을때 처리입니다.

// @ServerEndpoint 어노테이션을 명시함으로서 WEB 소켓으로 접속 가능한 URL 
// 정보를 명시하여 소켓 서버를 생성해주며 프로퍼티를 통해 decoder나 encoder를 명시할 수 있다.
// 싱글톤 패턴이다.
@ServerEndpoint("/main_chat")
public class main_chat {
    static int chk=0;
    static String quiz=null;
    static String ans=null;
    static String jang=null;
    static String quizList[]={"ㅎㄹㅍㅌ","ㅁㅇㄹ","ㅂㄴㅇ ㅈㅈ","ㅇㄴ","ㄷ ㅅㅋ","ㅌㄹㅅㅍㅁ","ㄷ ㅋ","ㅇㅈ",
    							"ㅉㄱㄴ ㅁㅁㄹ","ㅇㄸㅁㅁ","ㅇㄴㅇㅅ","ㄱㄱㄹ ㅈㅅ ㅋㄹㄹ","ㄴㄹㅌ"};
    static String ansList[]={"해리포터","미이라","분노의 질주","악녀","더 서클","트랜스포머","더 킹","옥자",
    							"짱구는 못말려","아따맘마","이누야샤","개구리 중사 케로로","나루토"};
    static String jangList[]={"영화","영화","영화","영화","영화","영화","영화","영화",
    							"애니","애니","애니","애니","애니"};
    static String str[];
    static String login;
    Random random = new Random();
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		chk++;
		str = message.split("div");
		sendAll(session, message,1);
		System.out.println(str[1]);
		System.out.println(str[0]);
		
		if(quiz!=null&&str[1].equals("문제줘")){
			sendAll(session, "",0);
		}
		if(quiz==null&&str[1].equals("문제줘")){
			int i = random.nextInt(13);
			quiz = quizList[i];
			ans = ansList[i];
			jang = jangList[i];
			sendAll(session, "",0);	
		}
		
	
		if(ans!=null&&ans.equals(str[1])){
			quiz=null;
			ans=null;
			sendAll(session, str[0]+"님 정답입니다.",3);
		}
		if(quiz!=null&&str[1].equals("포기")){
			quiz=null;
			ans=null;
			sendAll(session, str[0]+"님이 문제를 포기하셨습니다.",3);
		}
		if(str[0].equals("firstlogin")){
			if(login!=null&&login.contains(str[1])){
				login = login.replaceFirst(str[1]+"<br>", "");
			}
			login += str[1]+"<br>";
			login = login.replace("null", "");
			sendAll(session, "list"+"div참여자~없을수도..<br>"+login,2);
		}
		else if(str[0].equals("sessionEnd")){
			login = login.replace(str[1]+"<br>", "");
			sendAll(session, "list"+"div참여자~없을수도..<br>"+login,2);
			sendAll(session, "out"+"div"+str[1],1);
		}
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		 
		clients.remove(session);
	}
	
	public void sendAll(Session session, String message, int start) throws IOException{
	
		synchronized (clients) {
			for(Session client : clients){
				if(start==1){
					if(!client.equals(session)){
						client.getBasicRemote().sendText(message);
					}
				}
				//0 퀴즈 출제
				else if(start==0){
					client.getBasicRemote().sendText("("+jang+")div"+quiz+"div");
				}
				//2 전체말
				else if(start==2){
					client.getBasicRemote().sendText(message);
				}
				//3 정답
				else if(start==3){
					client.getBasicRemote().sendText("시스템div"
							+ "<font color=blue size=2>"+message+"</font>div ");
				}

			}
		}
	}
}
