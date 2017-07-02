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

		// 閤焼紳 努什闘 庚切伸稽 歳軒
		String strArray[] = message.split(":");

		/*
		 * if (strArray[0].equals("messageSend")) { synchronized (clients) { for
		 * (Session client : clients) { if (!client.equals(session)) {
		 * client.getBasicRemote().sendText(message); } } } }
		 */

		// 五獣走 穿勺
		if (strArray[0].equals("messageSend")) {
			synchronized (clients) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}

		// 室芝 葵 古芭
		if (strArray[0].equals("sessionValue")) {
			// 0-sessionValue, 1-号腰硲, 2-u_id
			me = strArray[2];
			map.put(me, session);
			Session usersession = map.get(me);
		}

		// 号舌戚 惟績獣拙 獄動聖 喚袈聖 凶
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
				message = "people_cnt_check:" + br_num + ":昔据戚 採膳杯艦陥.:";
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
				// Q0012:C:亜舌 承乞蒸澗 姥軒澗?:雇砥姥軒:姥軒:亨陥姥軒:格姥軒:
				// 0.坪球 1.政莫 2.庚薦 3.舛岩 4.神岩 5.神岩 6.神岩
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

		// 陥製 庚薦稽 角奄奄
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
			// Q0012:C:亜舌 承乞蒸澗 姥軒澗?:雇砥姥軒:姥軒:亨陥姥軒:格姥軒:
			// 0.坪球 1.政莫 2.庚薦 3.舛岩 4.神岩 5.神岩 6.神岩
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

		// 政煽亜 刊献 岩聖 閤焼紳陥.
		if (strArray[0].equals("button")) {
			// message = button:"+ br_num+":"+me+":"+code+":"+button4.value
			br_num = strArray[1];
			me = strArray[2];
			String q_code = strArray[3];
			String value = strArray[4];
			
			// 段奄 獄動 刊研凶 焼巷 疑拙 馬走 省惟 厳焼獄鍵陥.
			if(value.equals("徹鳶球1") || value.equals("徹鳶球2") || value.equals("徹鳶球3") || value.equals("徹鳶球4") ||
				value.equals("undefined"))
			{
				return;
			}
			
			BattlePlay battleplay = new BattlePlay();
			Battle_Play roomdto = new Battle_Play();
			// 神岩戚 2鯵昔走 溌昔馬澗 依
			List list = battleplay.playInfo(br_num);
			roomdto = (Battle_Play) list.get(0);
			int bp_state = roomdto.getBp_state();

			// 舛岩 葵 亜閃神奄
			String checkFlag = battleplay.checkanswer(q_code);

			if (bp_state < 1) {
				// 舛岩聖 堂鍵 井酔
				if (!value.equals(checkFlag)) {
					// bp_state 朝錘特 +1 廃陥.
					if (!value.equals("せせせせせ")) {
						battleplay.updatePlayRoomState(br_num);
					}
					message = "wrong:" + br_num + ":堂携柔艦陥. 雌企号戚 庚薦研 熱 疑照 奄陥形 爽室推:せせせせせ";
					synchronized (clients) {
						for (Session client : clients) {
							if (client.equals(session)) {
								client.getBasicRemote().sendText(message);
							}
						}
					}
					return;
				} else {
					// 舛岩聖 限秩 井酔
					// bp_01cnt, bp_02cnt 朝錘特廃陥.
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
			// 庚薦研 簡惟 葱 井酔
			else {
				if (!value.equals("せせせせせ")) {
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
