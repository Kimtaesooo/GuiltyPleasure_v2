package dao.boardmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.DBConnectionMgr;
import dto.U_Quiz;

public class QBorad {
	DBConnectionMgr dbm = null;
	Connection con = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String confrim = null;

	public QBorad() {
		try {
			dbm = DBConnectionMgr.getInstance();
			con = dbm.getConnection();
		} catch (Exception e) {
			System.out.println("연결 실패 " + e);
		}
	}

	// 퀴즈등록 게시판에 id로 해당하는 게 있는지 체크
	public String checkBoard(String id) {
		try {
			String check = "select u_id from U_QREG where u_id =?";
			psmt = con.prepareStatement(check);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				confrim = "있음";
			} else {
				confrim = "없음";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return confrim;
	}

	//게시판 클릭시 상세내용을 불러오는 메서드
	public U_Quiz getU_Quzi(String id){
		U_Quiz uqinform = new U_Quiz();
		String sql = "select * from U_QREG where UQ_NUM=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()){
				uqinform.setQ_type(rs.getString("Q_TYPE"));
				uqinform.setU_id(rs.getString("UQ_NUM"));
				uqinform.setUq_adopt(rs.getString("UQ_ADOPT"));
				uqinform.setUq_answer(rs.getString("UQ_ANSWER"));
				uqinform.setUq_num(rs.getString("UQ_NUM"));
				uqinform.setUq_question(rs.getString("UQ_QUESTION"));
				uqinform.setUq_regdate(rs.getString("UQ_REGDATE"));
				uqinform.setUq_wa_a(rs.getString("UQ_WA_A"));
				uqinform.setUq_wa_b(rs.getString("UQ_WA_B"));
				uqinform.setUq_wa_c(rs.getString("UQ_WA_C"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return uqinform;
	}
	
	
	// 전체 리스트를 가져오는 메서드
		public ArrayList getQBoard(String id) {
			// sql 2개 ; 하나는 유저가 접속했을때, 하나는 마스터가 접속했을때
			// 마스터가 접속했을땐 전 데이터 출력, 유저가 접속했을 땐 그 유저가 해당하는

			ArrayList qlist = new ArrayList<>();
			U_Quiz uq = null;
			String sql;
			String check = "테스트";
			if (!id.equals("master"))
				check = checkBoard(id);
			try {
				if (id.equals("master")) {
					//관리자일때
					sql = "select * from u_qreg order by uq_adopt";
					psmt = con.prepareStatement(sql);
					rs = psmt.executeQuery();
				} else if (check != null) {
					//유저이고 등록한 퀴즈가 몇개있을경우
					sql = "select * from u_qreg where u_id = ? order by uq_adopt";
					psmt = con.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					while (rs.next()) {
						uq = new U_Quiz();
						uq.setQ_type(rs.getString("Q_TYPE"));
						uq.setU_id(rs.getString("U_ID"));
						uq.setUq_adopt(rs.getString("UQ_ADOPT"));
						uq.setUq_answer(rs.getString("UQ_ANSWER"));
						uq.setUq_num(rs.getString("UQ_NUM"));
						uq.setUq_question(rs.getString("UQ_QUESTION"));
						uq.setUq_regdate(rs.getString("UQ_REGDATE"));
						uq.setUq_wa_a(rs.getString("UQ_WA_A"));
						uq.setUq_wa_b(rs.getString("UQ_WA_B"));
						uq.setUq_wa_c(rs.getString("UQ_WA_C"));
						qlist.add(uq);
					}
				} else if(check==null){
					//유저이지만 퀴즈가 몇개 없을경우
					qlist = null;
				}
			} catch (SQLException e) {
				System.out.println("퀴즈등록 게시판을 리턴 못했을 경우" + e);
				e.printStackTrace();
			} finally {

			}

			return qlist;

		}

}
