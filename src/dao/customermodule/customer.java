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
	
	public List getBoardList(String id){
		ArrayList list = new ArrayList();
		sql = "select * from service_center where u_id='"+id+"' order by sc_num desc";
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
				dto.setSc_content(rs.getString("sc_content"));
				dto.setSc_regdate(rs.getString("sc_regdate"));
				dto.setSc_state(rs.getString("sc_state"));
				dto.setSc_type(rs.getString("sc_type"));
				dto.setSc_num(rs.getString("sc_num"));
				}
		}
		catch(Exception err){
			System.out.println("getBoardList() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return dto;
	}
	
}
