package dao.customermodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.c_board;
import dto.u_battle;


public class customer {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql = "";
	
	public customer(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : "+err);
		}
	}
	
	//List.jsp
	public void regC_board(c_board dto){
	
		sql = "INSERT INTO SERVICE_CENTER (SC_NUM, U_ID, SC_TYPE, SC_TITLE, SC_CONTENT, SC_REGDATE, SC_IMAGE, SC_STATE)"+
		" VALUES ('SC'||LPAD((seq_sc_num.NEXTVAL),4,'0'),"+
		" ?,?,?,?,sysdate,'','대기')";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getU_id());
			pstmt.setString(2, dto.getSc_type());
			pstmt.setString(3, dto.getSc_title());
			pstmt.setString(4, dto.getSc_content());
			
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("regC_boadr() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	
	public List getBoardList(String id, String type, String key){
		ArrayList list = new ArrayList();
		if(key==null){
			if(id.equals("master")){
				sql = "select * from service_center  order by sc_state asc, sc_regdate desc";
			}else{
				sql = "select * from service_center where u_id='"+id+"' order by sc_state asc, sc_regdate desc";}
		}
		else{
			if(id.equals("master")){
				sql = "select * from service_center where "+type+" like '%"+key+"%' order by  sc_state asc, sc_regdate desc";
			}else{
				sql = "select * from service_center where u_id='"+id+"' and "+type+" like '%"+key+"%' order by sc_state asc, sc_regdate desc";}
		}
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				c_board dto = new c_board();
				dto.setSc_title(rs.getString("sc_title"));
				dto.setSc_content(rs.getString("sc_content"));
				dto.setSc_regdate(rs.getString("sc_regdate"));
				dto.setSc_state(rs.getString("sc_state"));
				dto.setSc_type(rs.getString("sc_type"));
				dto.setSc_num(rs.getString("sc_num"));
				dto.setU_id(rs.getString("u_id"));
				list.add(dto);
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
	
	public c_board getRead (String num){
		c_board dto = new c_board();
		
		sql = "select * from service_center where sc_num='"+num+"'";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				dto.setSc_title(rs.getString("sc_title"));
				dto.setU_id(rs.getString("u_id"));
				dto.setSc_content(rs.getString("sc_content"));
				dto.setSc_regdate(rs.getString("sc_regdate"));
				dto.setSc_state(rs.getString("sc_state"));
				dto.setSc_type(rs.getString("sc_type"));
				dto.setSc_num(rs.getString("sc_num"));
				}
		}
		catch(Exception err){
			System.out.println("getRead() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return dto;
	}
	
	public String getReadAs (String num){
		String as=null;
		sql = "select * from service_center_as where sc_num='"+num+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				as = rs.getString("sca_answer");
				}
		}
		catch(Exception err){
			System.out.println("getRead() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return as;
	}
	
	public void reg_Ans(String num, String ans){
		
		sql = "INSERT INTO SERVICE_CENTER_AS (SC_NUM, SCA_ANSWER) VALUES (?,?)";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.setString(2, ans);
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("regC_boadr() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	
	public void reg_Ans_fin(String num){
		
		sql = "UPDATE SERVICE_CENTER SET SC_STATE='완료' WHERE SC_NUM='"+num+"'";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("reg_Ans_fin() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	
	public String getUserPw (String u_id){
		String as=null;
		sql = "select * from userinfo where U_ID='"+u_id+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				as = rs.getString("u_pw");
				}
		}
		catch(Exception err){
			System.out.println("getUserPw() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return as;
	}
	
	public void DeleteUserQ (String sc_num){
		sql = "delete from service_center where sc_num='"+sc_num+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("DeleteUserQ() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	
	public void DeleteAns (String sc_num){
		sql = "delete from service_center_as where sc_num='"+sc_num+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("DeleteAns() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
}
