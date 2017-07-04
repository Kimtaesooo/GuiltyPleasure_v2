package dao.loginmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.u_battle;
import dto.u_single;
/**
 * 아이디/ 비밀번호 조회 클래스 입니다.
 * 
 */

public class idpw {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql = "";
	
	public idpw(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : "+err);
		}
	}
	
	//List.jsp
	public String[] getBoardList(){
		/**
		 * 회원 목록을 가져올 메소드 입니다.
		 */
		String [] u_find = new String [20];
		String [] arr = null;
		sql = "select * from u_find";
		try{
			int i=0;
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				u_find[i] = rs.getString("u_question");
				i++;
			}
			arr = new String [i];
			for(int a=0;a < i ; a++){
				arr[a] = u_find[a];
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return arr;
	}
	//아이디 찾기
	public String searchId(String name, String email){
		/**
		 * 아이디 찾기 메소드입니다.
		 */
		String id="";

		sql = "select u_id from userinfo where u_name = ? and u_email= ?";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				id = rs.getString("u_id");
			}
		}
		catch(Exception err){
			System.out.println("searchId 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return id;
	}
	//비밀번호 찾기
	public String searchPw(String id, String email, String U_QUESTION, String U_ANSWER){
		/**
		 * 비밀번호 찾기 메소드입니다.
		 * @param String pw 사용자의 패스워드 변수
		 * @return String pw 사용자의 패스워드를 반환
		 */
		String pw="";
		sql = "select u_pw from userinfo where u_id = ? and u_email= ? and u_question = ? and u_answer= ? ";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, U_QUESTION);
			pstmt.setString(4, U_ANSWER);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				pw = rs.getString("u_pw");				
			}
		}
		catch(Exception err){
			System.out.println("searchPw 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return pw;
	}
}
