package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MyInfoDTO;
import dbcp.DBConnectionMgr;

public class MyInfoDAO {
	DBConnectionMgr pool = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	
	public MyInfoDAO(){
		pool = DBConnectionMgr.getInstance();
		try {
			conn = pool.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public MyInfoDTO searchMyInfo(String id){
		MyInfoDTO dto = new MyInfoDTO();
		String sql = "SELECT U_ID , U_NICKNAME , U_NAME , U_EMAIL , U_ADDR , U_GENDER , U_INTRODUCE , U_DELETE , U_PHONE , "
				+ " TO_CHAR(U_BIRTH,'YYYY/MM/DD') AS U_BIRTH "
				+ " FROM USERINFO WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setId(rs.getString("u_id"));
				dto.setNickname(rs.getString("u_nickname"));
				dto.setName(rs.getString("u_name"));
				dto.setEmail(rs.getString("u_email"));
				dto.setPhone(rs.getString("u_phone"));
				dto.setAddr(rs.getString("u_addr"));
				dto.setDate(rs.getString("u_birth"));
				dto.setGender(rs.getString("u_gender"));
				dto.setIntroduce(rs.getString("u_introduce"));
				dto.setDelete(rs.getString("u_delete"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return dto;
	}
	
	public int reqDelUser(String id){
		int result = -1;
		String sql = "UPDATE USERINFO SET U_DELETE = 'W' WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return result;
	}

	public MyInfoDTO searchMyBattleInfo(String id) {
		MyInfoDTO dto = new MyInfoDTO();
		String sql = "SELECT UB_WIN, UB_LOSE, (UB_WIN+UB_LOSE) AS UB_TOTAL, DECODE(UB_WIN+UB_LOSE,0,0,ROUND(UB_WIN/(UB_WIN+UB_LOSE) *100 ,'2')) AS UB_PERCENT FROM U_BATTLE WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setUb_win(rs.getInt("ub_win"));
				dto.setUb_lose(rs.getInt("ub_lose"));
				dto.setUb_total(rs.getInt("ub_total"));
				dto.setUb_percent(rs.getDouble("ub_percent"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return dto;
	}

	public ArrayList<MyInfoDTO> searchMyBattlePoaInfo(String id) {
		ArrayList<MyInfoDTO> list = new ArrayList<MyInfoDTO>();
		String sql = "SELECT UP_TYPE , UP_A_CNT, UP_WA_CNT, DECODE(UP_A_CNT+UP_WA_CNT,0,0,ROUND(UP_A_CNT/(UP_A_CNT+UP_WA_CNT) *100 ,'2')) AS TOTAL_PERCENT FROM U_POA WHERE U_ID = ? "
					+"UNION ALL "
					+" SELECT 'รัวี' AS UP_TYPE, SUM(UP_A_CNT) AS UP_A_CNT, SUM(UP_WA_CNT) AS UP_WA_CNT, DECODE((SUM(UP_A_CNT)+SUM(UP_WA_CNT)),0,0,ROUND(SUM(UP_A_CNT)/(SUM(UP_A_CNT)+SUM(UP_WA_CNT))*100,'2')) AS TOTAL_PERCENT FROM U_POA WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MyInfoDTO dto = new MyInfoDTO();
				dto.setUp_type(rs.getString("up_type"));
				dto.setUp_a_cnt(rs.getInt("up_a_cnt"));
				dto.setUp_wa_cnt(rs.getInt("up_wa_cnt"));
				dto.setUp_total_percent(rs.getDouble("total_percent"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return list;
	}

	public ArrayList<MyInfoDTO> searchReqQInfo(String id) {
		ArrayList<MyInfoDTO> list = new ArrayList<MyInfoDTO>();
		String sql = "SELECT * FROM U_QREG WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MyInfoDTO dto = new MyInfoDTO();
				dto.setQ_type(rs.getString("q_type"));
				dto.setUq_question(rs.getString("uq_question"));
				dto.setUq_answer(rs.getString("uq_answer"));
				dto.setUq_wa_a(rs.getString("uq_wa_a"));
				dto.setUq_wa_b(rs.getString("uq_wa_b"));
				dto.setUq_wa_c(rs.getString("uq_wa_c"));
				dto.setUq_regdate(rs.getString("uq_regdate"));
				dto.setUq_adopt(rs.getString("uq_adopt"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		return list;
	}
}
