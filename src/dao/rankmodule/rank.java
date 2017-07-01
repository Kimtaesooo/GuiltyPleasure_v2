package dao.rankmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.u_battle;
import dto.u_single;

public class rank {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	//쿼리문 변수
	private String sql = "";
	
	public rank(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : "+err);
		}
	}
	
	//배틀 랭킹 리스트 가져오기
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
				u_battle.setU_comment(rs.getString("u_comment"));	
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
	//자신의 배틀 랭킹 가져오기
	public int BattleMyRank(String id){
		
		int rank=0;
		int myrank=0;
		sql = "select u_battle.u_id, userinfo.u_nickname, userinfo.u_comment, u_battle.ub_win, u_battle.ub_lose, userinfo.u_point from u_battle  inner join userinfo on u_battle.u_id = userinfo.u_id where u_battle.ub_win+u_battle.ub_lose>200 order by u_battle.ub_win/(u_battle.ub_win+u_battle.ub_lose) desc";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){	
				rank++;
				if(id.equals(rs.getString("u_id"))){
					myrank=rank;
				}
			}
		}
		catch(Exception err){
			System.out.println("MyRank() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return myrank;
	}
	
	//싱글 랭킹 가져오기
	public List getBoardList2(String type){
		ArrayList list = new ArrayList();
		sql = "select u_poa.u_id, userinfo.u_nickname, userinfo.u_comment, u_poa.up_wa_cnt, u_poa.up_a_cnt, u_poa.up_type, userinfo.u_point from u_poa  inner join userinfo on u_poa.u_id = userinfo.u_id where u_poa.up_type='"+type+"' and u_poa.up_a_cnt+u_poa.up_wa_cnt>200 order by u_poa.up_a_cnt/(u_poa.up_a_cnt+u_poa.up_wa_cnt) desc";
		try{

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				u_single u_single = new u_single();
				u_single.setA_cnt(rs.getInt("up_a_cnt"));
				u_single.setU_id(rs.getString("u_id"));
				u_single.setU_comment(rs.getString("u_comment"));
				u_single.setUp_type(rs.getString("up_type"));
				u_single.setWa_cnt(rs.getInt("up_wa_cnt"));
				u_single.setU_nickname(rs.getString("u_nickname"));
				u_single.setU_point(rs.getInt("u_point"));
				list.add(u_single);
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
	
	//내 싱글 랭킹 등수 가져오기
	public int SingleMyRank(String id, String type){
		
		int rank=0;
		int myrank=0;
		sql = "select u_poa.u_id, userinfo.u_nickname, userinfo.u_comment, u_poa.up_wa_cnt, u_poa.up_a_cnt, u_poa.up_type, userinfo.u_point from u_poa  inner join userinfo on u_poa.u_id = userinfo.u_id where u_poa.up_type='"+type+"' and u_poa.up_a_cnt+u_poa.up_wa_cnt>200 order by u_poa.up_a_cnt/(u_poa.up_a_cnt+u_poa.up_wa_cnt) desc";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){	
				rank++;
				if(id.equals(rs.getString("u_id"))){
					myrank=rank;
				}
			}
		}
		catch(Exception err){
			System.out.println("MyRank() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return myrank;
	}
	
}
