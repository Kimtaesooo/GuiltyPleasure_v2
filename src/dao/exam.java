package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.u_battle;

public class exam {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql = "";
	
	public exam(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : "+err);
		}
	}
	
	//List.jsp
	public List getBoardList(){
		ArrayList list = new ArrayList();

		sql = "select u_battle.u_id, userinfo.u_nickname, userinfo.u_comment, u_battle.ub_win, u_battle.ub_lose, userinfo.u_point from u_battle  inner join userinfo on u_battle.u_id = userinfo.u_id where u_battle.ub_win+u_battle.ub_lose>200 order by u_battle.ub_win/(u_battle.ub_win+u_battle.ub_lose) desc";

		try{

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				
				u_battle u_battle = new u_battle();
				u_battle.setU_id(rs.getString("u_id"));
				u_battle.setU_win(rs.getInt("ub_win"));
				u_battle.setU_lose(rs.getInt("ub_lose"));
				u_battle.setU_nickname(rs.getString("u_nickname"));
				
				list.add(u_battle);
				}
		}
		catch(Exception err){
			System.out.println("getBoardList() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return list;
	}
	
}
