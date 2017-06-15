package dao.playmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;
import dto.BattleRoom;

public class MakeRoom {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public MakeRoom() {
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		} catch (Exception err) {
			System.out.println("DBCP 인스턴스 참조 실패 : " + err);
		}
	}

	// 회원가입 등록, UserInfo는 dto 클래스
	public void regRoom(BattleRoom dto, String u_id) {
		String sql = "";
		sql = "insert into battleroom(br_subject, br_pw, br_type, br_cnt, br_point, u_id, br_people, br_gamestate) "
				+ "values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getU_id());
			pstmt.setString(2, dto.getU_pw());
			pstmt.setString(3, dto.getU_name());
			pstmt.setString(4, dto.getU_nickname());
			pstmt.setString(5, dto.getU_phone());
			pstmt.setString(6, dto.getU_email());
			pstmt.setString(7, dto.getU_addr());
			pstmt.setString(8, dto.getU_postnumber());
			pstmt.setString(9, dto.getU_birth());
			pstmt.setString(10, dto.getU_gender());
			pstmt.setString(11, dto.getU_introduce());
			// pstmt.setString(12, dto.getU_regdate());
			// pstmt.setString(13, dto.getU_point());
			// pstmt.setString(14, dto.getU_power());
			// pstmt.setString(15, dto.getU_delete());
			pstmt.setString(12, dto.getU_question());
			pstmt.setString(13, dto.getU_answer());
			pstmt.setString(14, dto.getU_comment());

			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("regUser 첫번째에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}
}
