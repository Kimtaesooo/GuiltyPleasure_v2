package dao.shopmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class BonusManager {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public BonusManager() {
		try {
			pool = DBConnectionMgr.getInstance();

		} catch (Exception err) {
			System.out.println("DBCP 인스턴스 참조 실패:" + err);
		} finally {

		}
	}

	private static BonusManager instance = new BonusManager();

	public static BonusManager getInstance() {
		return instance;
	}
	
	
	public void bonusPoint(String id) {
		String sql = "update userinfo set u_point=u_point+10 where u_id = ?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("bonusPoint()에서오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public void searchQuiz(String id) {
		String sql = "update userinfo set u_point=u_point+100 where u_id = ?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("searchQuiz()에서오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	public void jaumPoint(String u_nickname) {
		String sql = "update userinfo set u_point=u_point+5 where u_nickname = ?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_nickname);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("u_nickname()에서오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

}
