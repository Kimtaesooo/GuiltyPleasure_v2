package dao.quizmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbcp.DBConnectionMgr;
import dto.Quiz;
import dto.QuizResult;

/**
 * 퀴즈게임과 관련된 db연결및 작업기능은 여기에서 만듬
 * */
public class GetQuiz {
	DBConnectionMgr db = null;
	Connection con = null;

	/**
	 * 먼저 db와 연결하기위해 부르고 이 객체를 통해 퀴즈를 생성한다.
	 * @see GetQuiz db와 연결을 해주는 생성자
	 * */
	public GetQuiz() {
		try {
			this.db = DBConnectionMgr.getInstance();
			this.con = db.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 *  퀴즈 한개를 생성하는 메서드
	 *  @return Quiz db에서 퀴즈의 정보를 임의로 한개 가져와 Quiz객체를 생성하고 데이터를 저장해서 반환
	 * */
	public Quiz makeQuiz() {
		PreparedStatement pre = null;
		ResultSet rs = null;
		Quiz q = null;
		String sql = "select * from(select * from quiz order by dbms_random.value) where rownum < 5";
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
		}finally{
			db.freeConnection(con, pre, rs);
		}
		return q;
	}
	
	/**
	 * 퀴즈의 숫자만큼 추출하는 메서드
	 * @param int 추출하고자할 문제수를 받는 매개변수
	 * @See Quiz  퀴즈정보를 저장하는 Quiz클래스
	 * @return ArrayList 매개변수만큼의 문제를 임의로 가져와 Quiz클래스가 담긴 ArrayList를 반환
	 * */
	public ArrayList makeQuiz(int val) {
		PreparedStatement pre = null;
		ResultSet rs = null;
		Quiz q = null;
		ArrayList array = new ArrayList<>();
		String sql = "select * from(select * from quiz order by dbms_random.value) where rownum <= ?";
		try {
			pre = con.prepareStatement(sql);
			pre.setInt(1, val);
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
				
				array.add(q);
			}
		} catch (SQLException e) {
			System.out.println("getquiz : " + e);
		}finally{
			db.freeConnection(con, pre, rs);
		}
		return array;
	}

	
	/**
	 * 퀴즈 정답 오답과 이용자의 정답수 오답수를 기록하는 메서드
	 * 
	 * @param ArrayList 퀴즈 결과들이 저장된 ArrayList를 매개변수로 받음
	 * */
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
			}finally{
				db.freeConnection(con, psmt, rs);
			}

		}

	}

	
}
