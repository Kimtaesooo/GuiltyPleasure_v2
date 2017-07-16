package dao.quizmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DBConnectionMgr;
/**
 * 포인트를 저장하기위해 db와 연동되는 클래스
 * */
public class GetPoint {
	DBConnectionMgr db;
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	/**
	 * db와 연동하는 클래스
	 * */
	public GetPoint() {
		try {
			db = DBConnectionMgr.getInstance();
			con = db.getConnection();
		} catch (Exception e) {
			System.out.println("포인트적립을 위한 디비연결 실패");
		}
	}
	
	/**
	 * @param String id를 매개변수로 받음
	 * 
	 * */
	public int SavePoint(String id){
		String sql = "update USERINFO set U_POINT = U_POINT + 10 where U_ID = ?";
		int  i = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.freeConnection(con, psmt, rs);
		}
		return i;
	}
	
	/**
	 * @param String  유저 id를 매개변수로 받음
	 * @param int 객관식에서 사용될 point를 매개변수로 받음
	 * */
	public int SavePoint(String id, int point){
		String sql = "update USERINFO set U_POINT = U_POINT + ? where U_ID = ?";
		int  i = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, point);
			psmt.setString(2, id);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.freeConnection(con, psmt, rs);
		}
		return i;
	}
	
	
}
