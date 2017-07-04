package jaum_play;
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

import dao.shopmodule.ShopManager;
/**
 * 	자음퀴즈 클래스 입니다.
 *
 */

@ServerEndpoint("/main_chat")
public class main_chat {
	/**
	 * 출력용 메소드 입니다.
	 * @param String quiz 출제된 퀴즈 변수
	 * @param String ans 출제된 퀴즈의 정답 변수
	 * @param String jang 출제된 퀴즈의 장르 변수
	 * @param String quizList[] DB 대신 사용된 퀴즈를 모아둔 리스트입니다.
	 * @param String ansList[] DB 대신 사용된 퀴즈의 정답을 모아둔 리스트입니다.
	 * @param String jangList[] DB 대신 사용된 퀴즈의 장르를 모아둔 리스트입니다.
	 * @param String str[] 받아온 문자열을 분리 할때 사용된 변수 입니다.
	 * @param String login 현재 접속된 사용자를 저장시켜둘 변수 입니다.
 	 */

	//출제된 문제, 정답, 장르 변수
    static String quiz=null;
    static String ans=null;
    static String jang=null;
    //DB 를 대신 사용된 임시 리스트
    static String quizList[]={"ㅎㄹㅍㅌ","ㅁㅇㄹ","ㅂㄴㅇ ㅈㅈ","ㅇㄴ","ㄷ ㅅㅋ","ㅌㄹㅅㅍㅁ","ㄷ ㅋ","ㅇㅈ",
    							"ㅉㄱㄴ ㅁㅁㄹ","ㅇㄸㅁㅁ","ㅇㄴㅇㅅ","ㄱㄱㄹ ㅈㅅ ㅋㄹㄹ","ㄴㄹㅌ"};
    static String ansList[]={"해리포터","미이라","분노의 질주","악녀","더 서클","트랜스포머","더 킹","옥자",
    							"짱구는 못말려","아따맘마","이누야샤","개구리 중사 케로로","나루토"};
    static String jangList[]={"영화","영화","영화","영화","영화","영화","영화","영화",
    							"애니","애니","애니","애니","애니"};
    //웹소켓 문자열 분리를 위한 변수
    static String str[];
    //접속된 사용자 표시를 위한 변수
    static String login;
    //문제 랜덤 출제를 위한 메소드
    Random random = new Random();
    //정답시 사용자에게 포인트 줄때 사용
    ShopManager point = new ShopManager();
    //세션값을 클라이언트에 저장
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen
	//웹소켓 접속시 클라이언트에 추가
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnMessage
	//메시지 도착시 발생될 메소드
	public void onMessage(String message, Session session) throws IOException {
		/**
		 * 메시지 도착시 발생되는 메소드 입니다. 
		 * 받아온 메시지 분리해서 분리한 명령어를 if 문을 이용하여 사용자에게 적절한 메시지를 다시 전송
		 */
		// 받은 문자열을 분리
		str = message.split("div");
		// 일반 채팅일 경우 send 를 통해 전송
		sendAll(session, message,1);
		// 문제줘 입력시 이미 퀴즈가 있을 경우 있는 문제 다시 출력
		if(quiz!=null&&str[1].equals("문제줘")){
			sendAll(session, "",0);
		}
		// 퀴즈가 없을 경우 랜덤돌려서 출제
		if(quiz==null&&str[1].equals("문제줘")){
			int i = random.nextInt(13);
			quiz = quizList[i];
			ans = ansList[i];
			jang = jangList[i];
			sendAll(session, "",0);	
		}
		
		// 정답비교
		if(ans!=null&&ans.equals(str[1])){
			//퀴즈 정답 리셋
			quiz=null;
			ans=null;
			//맞춘 사용자에게 포인트 
			point.jaumPoint(str[0]);
			//정답 메시지 출력
			sendAll(session, str[0]+"님 정답입니다.",3);
		}
		// 퀴즈가 있을때 포기를 입력시
		if(quiz!=null&&str[1].equals("포기")){
			//퀴즈 정답 초기화
			quiz=null;
			ans=null;
			//문제 포기 메시지 출력
			sendAll(session, str[0]+"님이 문제를 포기하셨습니다.",3);
		}
		// 웹소켓 처음 접속시 
		if(str[0].equals("firstlogin")){
			//로그인에 이미 사용자가 추가되있는경우
			if(login!=null&&login.contains(str[1])){
				//이전에 기록됬던 값 제거
				login = login.replaceFirst(str[1]+"<br>", "");
			}
			//사용자 아이디를 로그인에 추가
			login += str[1]+"<br>";
			//로그인에 null값 제거
			login = login.replace("null", "");
			sendAll(session, "list"+"div<h5>참가자~없을수도..</h5>"+login,2);
		}
		// 나가기 눌렀을때
		else if(str[0].equals("sessionEnd")){
			//접속 목록에서 사용자 제거
			login = login.replace(str[1]+"<br>", "");
			sendAll(session, "list"+"div<h5>참가자~없을수도..</h5>"+login,2);
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
					client.getBasicRemote().sendText("systemdiv"+"("
				+jang+") "+quiz+"div");
				}
				//2 전체말
				else if(start==2){
					client.getBasicRemote().sendText(message);
				}
				//3 정답
				else if(start==3){
					client.getBasicRemote().sendText("systemdiv"
							+ "<font color=blue size=5>"+message+"</font>div ");
				}

			}
		}
	}
}
