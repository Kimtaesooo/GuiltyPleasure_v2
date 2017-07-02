package dao.ts_battlemodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Battle_Play;
import dto.Battle_Room;
import dto.Quiz;

public class BattlePlay {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public BattlePlay() {
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		} catch (Exception err) {
			System.out.println("DBCP 인스턴스 참조 실패 : " + err);
		}
	}

	// battleRoom.jsp 배틀 게임방 생성
	public void regRoom(Battle_Room dto, String u_id) {
		String sql = "";
		sql = "insert into battle_room(br_num, br_subject, br_pw, br_type, br_cnt, br_point, u_id, br_people, br_gamestate, br_ip) "
				+ "values('BR'||LPAD((seq_br_num.NEXTVAL),4,'0'),?,?,?,?,?,?,1,'N',?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBr_subject());
			pstmt.setInt(2, dto.getBr_pw());
			pstmt.setString(3, dto.getBr_type());
			pstmt.setInt(4, dto.getBr_cnt());
			pstmt.setInt(5, dto.getBr_point());
			pstmt.setString(6, u_id);
			pstmt.setString(7, dto.getBr_ip());
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("regRoom 첫번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// battleRoom.jsp 배틀 룸 목록 생성
	public List getListRoom() {
		ArrayList list = new ArrayList();
		String sql = "select br_num, br_subject, br_pw, decode (br_type, 'A', '연예', 'B','넌센스','C','상식','D','아재') as br_type, "
						+ "br_cnt, br_point, u_id, br_people, br_gamestate, br_ip "
						+ "from battle_room order by br_gamestate";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Battle_Room battleliset = new Battle_Room();
				battleliset.setBr_num(rs.getString("br_num"));
				battleliset.setBr_subject(rs.getString("br_subject"));
				battleliset.setBr_pw(rs.getInt("br_pw"));
				battleliset.setBr_type(rs.getString("br_type"));
				battleliset.setBr_cnt(rs.getInt("br_cnt"));
				battleliset.setBr_point(rs.getInt("br_point"));
				battleliset.setU_id(rs.getString("u_id"));
				battleliset.setBr_people(rs.getInt("br_people"));
				battleliset.setBr_gamestate(rs.getString("br_gamestate"));

				list.add(battleliset);
			}
		} catch (Exception err) {
			System.out.println("getListRoom();에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	// playRoom.jsp 방 정보 소환, 유저 아이디로 검색
	public List roomInfo(String u_id) {
		int br_people = 1;
		ArrayList list = new ArrayList();
		String sql = "select * from battle_room where u_id ='" + u_id + "'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Battle_Room room = new Battle_Room();
				room.setBr_num(rs.getString("br_num"));
				room.setBr_subject(rs.getString("br_subject"));
				room.setBr_pw(rs.getInt("br_pw"));
				room.setBr_type(rs.getString("br_type"));
				room.setBr_cnt(rs.getInt("br_cnt"));
				room.setBr_point(rs.getInt("br_point"));
				room.setU_id(rs.getString("u_id"));
				room.setBr_people(rs.getInt("br_people"));
				room.setBr_gamestate(rs.getString("br_gamestate"));
				room.setBr_ip(rs.getString("br_ip"));
				list.add(room);
			}
		} catch (Exception err) {
			System.out.println("roomInfo();에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	// playRoom.jsp 방 정보 소환, 방 번호로 검색
	public List roomInfo2(String br_num) {
		int br_people = 1;
		ArrayList list = new ArrayList();
		String sql = "select * from battle_room where br_num ='" + br_num + "'";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Battle_Room room = new Battle_Room();
				room.setBr_num(rs.getString("br_num"));
				room.setBr_subject(rs.getString("br_subject"));
				room.setBr_pw(rs.getInt("br_pw"));
				room.setBr_type(rs.getString("br_type"));
				room.setBr_cnt(rs.getInt("br_cnt"));
				room.setBr_point(rs.getInt("br_point"));
				room.setU_id(rs.getString("u_id"));
				room.setBr_people(rs.getInt("br_people"));
				room.setBr_gamestate(rs.getString("br_gamestate"));
				room.setBr_ip(rs.getString("br_ip"));
				list.add(room);
			}
		} catch (Exception err) {
			System.out.println("roomInfo();에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	// playRoom.jsp battle_play 정보 소환
	public List playInfo(String br_num) {
		ArrayList list = new ArrayList();
		String sql = "select * from battle_play where br_num ='" + br_num + "'";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Battle_Play room = new Battle_Play();
				room.setQ_code(rs.getString("q_code"));
				room.setUser01(rs.getString("user01"));
				room.setUser02(rs.getString("user02"));
				room.setBp_01cnt(rs.getInt("bp_01cnt"));
				room.setBp_02cnt(rs.getInt("bp_02cnt"));
				room.setBp_count(rs.getInt("bp_count"));
				room.setBp_state(rs.getInt("bp_state"));
				list.add(room);
			}
		} catch (Exception err) {
			System.out.println("playInfo();에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	// playRoom DB에 방번호와 방장 아이디 집어넣기
	public void playRoom(String br_num, String u_id, int br_cnt) {
		String sql = "";
		sql = "insert into battle_play(br_num, q_code, user01, user02, bp_01cnt, bp_02cnt, bp_count, bp_state) "
				+ "values(?,'',?,'',0,0,?,0)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, br_num);
			pstmt.setString(2, u_id);
			pstmt.setInt(3, br_cnt);
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("playRoom 첫번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 방에 방장이 아닌 다른 사람이 접속했을 때 등록
	public void updatePlayRoom(String br_num, String gameuser) {
		String sql = "";
		sql = "update battle_play set user02 = '" + gameuser + "' where br_num = '" + br_num + "'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("updatePlayRoom 첫번째에서 오류");
			err.printStackTrace();
		}

		sql = "update battle_room set br_people = br_people + 1 where br_num = '" + br_num + "'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("updatePlayRoom 두번째에서 오류");
			err.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 배틀 퀴즈 가지고오기
	public List getQuiz(String q_type) {
		PreparedStatement pre = null;
		ResultSet rs = null;
		Quiz q = null;
		ArrayList list = new ArrayList();
		String sql = "select * from(select * from quiz where q_type ='"+q_type+"' order by dbms_random.value) where rownum <= 1";
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			if (rs.next()) {
				q = new Quiz();
				q.setQ_code(rs.getString("Q_CODE"));
				q.setQ_answer(rs.getString("Q_ANSWER"));
				q.setQ_question(rs.getString("Q_QUESTION"));
				q.setQ_wa_a(rs.getString("Q_WA_A"));
				q.setQ_wa_b(rs.getString("Q_WA_B"));
				q.setQ_wa_c(rs.getString("Q_WA_C"));
				q.setQ_type(rs.getString("Q_TYPE"));

				list.add(q);
			}
		} catch (SQLException e) {
			System.out.println("getquiz : " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	// 배틀게임 시작하면 방 상태 변경
	public String updateBattleRoomState(String br_num) {
		String startFlag = "";
		String sql = "";

		// 게임 상태 받아온다.
		sql = "select * from battle_room where br_num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, br_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				startFlag = rs.getString("br_gamestate");
			}
		} catch (Exception err) {
			System.out.println("updateBattleRoomState 첫번째에서 오류");
			err.printStackTrace();
		}

		if (startFlag.equals("N")) {
			sql = "update battle_room set br_gamestate = 'Y' where br_num = '" + br_num + "'";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();

			} catch (Exception err) {
				System.out.println("updateBattleRoomState 두번째에서 오류");
				err.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		} else if (true) {
			pool.freeConnection(con, pstmt, rs);
		}

		return startFlag;
	}

	// 배틀 플레이 유저 정답 처리
	public void updatePlayCnt(String br_num, String gameuser) {
		String sql = "";
		String user01 = "";
		String user02 = "";
		sql = "select * from battle_play where br_num = '" + br_num + "'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user01 = rs.getString("USER01");
				user02 = rs.getString("USER02");
			}
		} catch (Exception err) {
			System.out.println("updatePlayCnt(인자2개) 첫번째에서 오류");
			err.printStackTrace();
		}

		if (gameuser.equals(user01)) {
			sql = "update battle_play set bp_01cnt = bp_01cnt+1, bp_count=bp_count+1 where br_num = '" + br_num + "'";
		} else {
			sql = "update battle_play set bp_02cnt = bp_02cnt+1, bp_count=bp_count+1 where br_num = '" + br_num + "'";
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("updatePlayCnt(인자2개) 두번째에서 오류");
			err.printStackTrace();
		}

		sql = "update battle_play set bp_state = 0 where br_num = '" + br_num + "'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("updatePlayCnt(인자2개) 세번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// playroom bp_state 상태 0으로 만들기
	public void updatePlayCnt(String br_num) {
		String sql = "update battle_play set bp_state = 0 where br_num = '" + br_num + "'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("updatePlayCnt(인자1개) 첫번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 배틀 정답 체크
	public String checkanswer(String q_code) {
		String sql = "";
		String answer = "";
		sql = "select * from quiz where q_code = '" + q_code + "'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				answer = rs.getString("q_answer");
			}
		} catch (Exception err) {
			System.out.println("checkanswer 첫번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return answer;
	}

	// 배틀게임 오답 카운트 넣기
	public void updatePlayRoomState(String br_num) {
		String sql = "";
		// 게임 상태 받아온다.
		sql = "update battle_play set bp_state = bp_state+1 where br_num = '" + br_num + "'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.executeQuery();
		} catch (Exception err) {
			System.out.println("updatePlayRoomState 첫번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

}
