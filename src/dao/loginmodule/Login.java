package dao.loginmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.UserInfo;

public class Login {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public Login(){
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : " + err);
		}
	}
	
	// 유저정보 얻기
	/**
	 * 유저 정보 얻는 메서드
	 * @param u_id
	 * 			유저 정보를 얻기 위한 id값 받음
	 * @return UserInfo dto 리턴
	 */
	public UserInfo getUser(String u_id){
		UserInfo dto = new UserInfo();
		String sql = "select * from userinfo where u_id = '"+ u_id +"'";
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setU_id(rs.getString("u_id"));
				dto.setU_pw(rs.getString("u_pw"));
				dto.setU_name(rs.getString("u_name"));
				dto.setU_nickname(rs.getString("u_nickname"));
				dto.setU_phone(rs.getString("u_phone"));
				dto.setU_email(rs.getString("u_email"));
				dto.setU_addr(rs.getString("u_addr"));
				dto.setU_postnumber(rs.getString("u_postnumber"));
				dto.setU_birth(rs.getString("u_birth"));
				dto.setU_gender(rs.getString("u_gender"));
				dto.setU_introduce(rs.getString("u_introduce"));
				dto.setU_regdate(rs.getString("u_regdate"));
				dto.setU_point(rs.getInt("u_point"));
				dto.setU_power(rs.getInt("u_power"));
				dto.setU_delete(rs.getString("u_delete"));
				dto.setU_question(rs.getString("u_question"));
				dto.setU_answer(rs.getString("u_answer"));
				dto.setU_comment(rs.getString("u_comment"));				
			}
		}
		catch(Exception err){
			System.out.println("getUser에서 오류");
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
		
	}

}
