package dao.quizmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbcp.DBConnectionMgr;
import dto.Quiz;
import dto.QuizResult;

//퀴즈게임과 관련된 db연결및 작업기능은 여기에서 만듬
public class GetQuiz {
	DBConnectionMgr db = null;
	Connection con = null;

	// 먼저 db와 연결하기위해 부르고 이 객체를 통해 퀴즈를 생성한다.
	public GetQuiz() {
		try {
			this.db = DBConnectionMgr.getInstance();
			this.con = db.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 퀴즈를 생성하는 메서드
	public Quiz makeQuiz() {
		PreparedStatement pre = null;
		ResultSet rs = null;
		Quiz q = null;
		String sql = "select * from(select * from quiz order by dbms_random.value) where rownum <6";
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				q = new Quiz();
				q.setQ_code(rs.getString("Q_CODE"));
				q.setQ_answer(rs.getString("Q_ANSWER"));
				q.setQ_question(rs.getString("Q_QUESTION"));
				q.setQ_wa_a(rs.getString("Q_WA_A"));
				q.setQ_wa_b(rs.getString("Q_WA_B"));
				q.setQ_wa_c(rs.getString("Q_WA_C"));
				q.setQ_type(rs.getString("Q_TYPE"));
			}
		} catch (SQLException e) {
			System.out.println("getquiz : " + e);
		}
		return q;
	}

	public void setResult(ArrayList list) {
		QuizResult qrs = null;
		ResultSet rs = null;
		PreparedStatement psmt = null;
		for (int i = 0; i < list.size(); i++) {
			qrs = (QuizResult) list.get(i);
			// quiz에 들어갈 항목들
			String q_code = qrs.getQ_code();
			int ca_count = qrs.getQ_ca_count();
			int wa_count = qrs.getQ_wa_count();
			try {
				String sql = "update quiz set Q_CA_CNT = q_ca_cnt + ?, Q_WA_CNT = Q_WA_CNT + ? where Q_code = ?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, ca_count);
				psmt.setInt(2, wa_count);
				psmt.setString(3, q_code);
				psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 유저에게 들어갈 항목들
			String u_id = qrs.getU_id();
			int ca_sum = qrs.getCa_sum();
			int wa_sum = qrs.getWa_sum();
			String q_type = qrs.getQ_type();
			try {
				String sql = "update U_POA set UP_A_CNT = UP_A_CNT + ?, UP_WA_CNT = UP_WA_CNT + ? "
						+ "where U_ID = ? and UP_TYPE = ?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, ca_sum);
				psmt.setInt(2, wa_count);
				psmt.setString(3, u_id);
				psmt.setString(4, q_type);
				psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	
}
