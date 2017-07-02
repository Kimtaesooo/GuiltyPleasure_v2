package dao.ts_battlemodule;

import java.io.IOException;
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
import dto.Battle_Room;
import dto.Quiz;

@ServerEndpoint("/battlesocket")
public class Websocket {
	static HashMap<String, Session> map = new HashMap<String, Session>();

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	String me = "";
	String br_num = "";
	String user01 = "";
	String user02 = "";
	Boolean startFlag = false;

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);

		// 받아온 텍스트 문자열로 분리
		String strArray[] = message.split(":");

		/*
		 * if (strArray[0].equals("messageSend")) { synchronized (clients) { for
		 * (Session client : clients) { if (!client.equals(session)) {
		 * client.getBasicRemote().sendText(message); } } } }
		 */

		// 메시지 전송
		if (strArray[0].equals("messageSend")) {
			synchronized (clients) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}

		// 세션 값 매핑
		if (strArray[0].equals("sessionValue")) {
			// 0-sessionValue, 1-방번호, 2-u_id
			me = strArray[2];
			map.put(me, session);
			Session usersession = map.get(me);
		}

		// 방장이 게임시작 버튼을 눌렀을 때
		if (strArray[0].equals("gameStart")) {
			// message =  "gameStart:" + br_num + ":" + me + ":" + q_type;
			br_num = strArray[1];
			me = strArray[2];
			String q_type = strArray[3];

			BattlePlay battleplay = new BattlePlay();
			List list = battleplay.roomInfo(me);
			Battle_Room room = (Battle_Room) list.get(0);
			int people_cnt = room.getBr_people();
			if (people_cnt < 2) {
				message = "people_cnt_check:" + br_num + ":인원이 부족합니다.:";
				synchronized (clients) {
					for (Session client : clients) {
						if (client.equals(session)) {
							client.getBasicRemote().sendText(message);
						}
					}
				}
				return;
			}

			String startFlag = battleplay.updateBattleRoomState(br_num);

			if (startFlag.equals("N")) {
				String question = "";
				String answer = "";
				String wa1 = "";
				String wa2 = "";
				String wa3 = "";
				String code = "";

				GetBattleQuiz getBattleQuiz = new GetBattleQuiz();
				String quiz = getBattleQuiz.getQuiz(q_type);

				String quizinfo[] = quiz.split(":");
				// Q0012:C:가장 쓸모없는 구리는?:멍텅구리:구리:딱다구리:너구리:
				// 0.코드 1.유형 2.문제 3.정답 4.오답 5.오답 6.오답
				code = quizinfo[0];
				question = quizinfo[2];
				answer = quizinfo[3];
				wa1 = quizinfo[4];
				wa2 = quizinfo[5];
				wa3 = quizinfo[6];
				message = "getget:" + br_num + ":" + code + ":" + question + ":" + answer + ":" + wa1 + ":" + wa2 + ":"
						+ wa3 + ":";
				synchronized (clients) {
					for (Session client : clients) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}

		// 다음 문제로 넘기기
		if (strArray[0].equals("nextSend")) {
			// message = "nextSend:" + br_num + ":" + me + ":" + q_type);
			br_num = strArray[1];
			me = strArray[2];
			String q_type = strArray[3];

			String question = "";
			String answer = "";
			String wa1 = "";
			String wa2 = "";
			String wa3 = "";
			String code = "";

			GetBattleQuiz getBattleQuiz = new GetBattleQuiz();
			String quiz = getBattleQuiz.getQuiz(q_type);

			String quizinfo[] = quiz.split(":");
			// Q0012:C:가장 쓸모없는 구리는?:멍텅구리:구리:딱다구리:너구리:
			// 0.코드 1.유형 2.문제 3.정답 4.오답 5.오답 6.오답
			code = quizinfo[0];
			question = quizinfo[2];
			answer = quizinfo[3];
			wa1 = quizinfo[4];
			wa2 = quizinfo[5];
			wa3 = quizinfo[6];
			message = "getget:" + br_num + ":" + code + ":" + question + ":" + answer + ":" + wa1 + ":" + wa2 + ":"
					+ wa3 + ":";
			synchronized (clients) {
				for (Session client : clients) {
					client.getBasicRemote().sendText(message);
				}
			}
		}

		// 유저가 누른 답을 받아온다.
		if (strArray[0].equals("button")) {
			// message = button:"+ br_num+":"+me+":"+code+":"+button4.value
			br_num = strArray[1];
			me = strArray[2];
			String q_code = strArray[3];
			String value = strArray[4];
			
			// 초기 버튼 누를때 아무 동작 하지 않게 막아버린다.
			if(value.equals("키패드1") || value.equals("키패드2") || value.equals("키패드3") || value.equals("키패드4") ||
				value.equals("undefined"))
			{
				return;
			}
			
			BattlePlay battleplay = new BattlePlay();
			Battle_Play roomdto = new Battle_Play();
			// 오답이 2개인지 확인하는 것
			List list = battleplay.playInfo(br_num);
			roomdto = (Battle_Play) list.get(0);
			int bp_state = roomdto.getBp_state();

			// 정답 값 가져오기
			String checkFlag = battleplay.checkanswer(q_code);

			if (bp_state < 1) {
				// 정답을 틀린 경우
				if (!value.equals(checkFlag)) {
					// bp_state 카운팅 +1 한다.
					if (!value.equals("ㅋㅋㅋㅋㅋ")) {
						battleplay.updatePlayRoomState(br_num);
					}
					message = "wrong:" + br_num + ":틀렸습니다. 상대방이 문제를 풀 동안 기다려 주세요:ㅋㅋㅋㅋㅋ";
					synchronized (clients) {
						for (Session client : clients) {
							if (client.equals(session)) {
								client.getBasicRemote().sendText(message);
							}
						}
					}
					return;
				} else {
					// 정답을 맞춘 경우
					// bp_01cnt, bp_02cnt 카운팅한다.
					battleplay.updatePlayCnt(br_num, me);
					message = "next:" + br_num + ":";
					synchronized (clients) {
						for (Session client : clients) {
							if (client.equals(session)) {
								client.getBasicRemote().sendText(message);
							}
						}
					}
					return;
				}
			}
			// 문제를 늦게 푼 경우
			else {
				if (!value.equals("ㅋㅋㅋㅋㅋ")) {
					if (value.equals(checkFlag)) {
						battleplay.updatePlayCnt(br_num, me);
						message = "next:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								if (client.equals(session)) {
									client.getBasicRemote().sendText(message);
								}
							}
						}
						return;
					} else {
						battleplay.updatePlayCnt(br_num);
						message = "next:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								if (client.equals(session)) {
									client.getBasicRemote().sendText(message);
								}
							}
						}
						return;
					}
				}
			}
		}

	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}
