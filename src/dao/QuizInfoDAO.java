package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dbcp.DBConnectionMgr;
import dto.QuizInfoDTO;

public class QuizInfoDAO {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	
	public QuizInfoDAO(){
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
		try {
			conn = pool.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<QuizInfoDTO> searchList(QuizInfoDTO quiz, int pagesize , int no, String order){
		ArrayList<QuizInfoDTO> list = new ArrayList<QuizInfoDTO>();
		
		boolean question = false;
		boolean type = false;
		boolean id = false;
		
		int insql = 1;
		int inpstmt = 1;
		
		String sql = "SELECT * FROM ( SELECT Q.Q_CODE , DECODE(Q.Q_TYPE,'A','연애','B','넌센스','C','언어','D','상식','기타') AS Q_TYPE , Q.Q_QUESTION , Q.Q_ANSWER , Q.Q_WA_A , Q.Q_WA_B , Q.Q_WA_C " 
					+" , U.U_ID , ROW_NUMBER() OVER (ORDER BY "+order+" ) AS NUM FROM QUIZ Q INNER JOIN USERINFO U "
				    +" ON Q.U_ID = U.U_ID ";
		
		if(quiz.getQ_type().length()>0){
			if(insql == 1){
			sql += " WHERE Q.Q_TYPE LIKE '%'||?||'%' "; 
			}else{
				sql += " AND Q.Q_TYPE LIKE '%'||?||'%' ";
			}
			insql++;
			type = true;
		}
		
		if(quiz.getQ_question().length()>0){
			if(insql == 1){
				sql += " WHERE Q.Q_QUESTION LIKE '%'||?||'%' "; 
			}else{
				sql += " AND Q.Q_QUESTION LIKE '%'||?||'%' ";
			}
			insql++;
			question = true;
		}
		
		if(quiz.getU_id().length()>0){
			if(insql == 1){
				sql += " WHERE Q.U_ID LIKE '%'||?||'%' "; 
			}else{
				sql += " AND Q.U_ID LIKE '%'||?||'%' ";
			}
			insql++;
			id = true;
		}
		
		sql  += " ) WHERE NUM BETWEEN "+ (pagesize*(no-1)+1)+" AND "+pagesize*no;
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(type){
				pstmt.setString(inpstmt, quiz.getQ_type());
				inpstmt++;
			}
			
			if(question){
				pstmt.setString(inpstmt, quiz.getQ_question());
				inpstmt++;
			}
			
			if(id){
				pstmt.setString(inpstmt, quiz.getU_id());
				inpstmt++;
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				QuizInfoDTO dto = new QuizInfoDTO();
				dto.setQ_code(rs.getString("q_code"));
				dto.setQ_type(rs.getString("q_type"));
				dto.setQ_question(rs.getString("q_question"));
				dto.setU_id(rs.getString("u_id"));
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
	
	public int listCount(QuizInfoDTO quiz){
		int count = 0;
		String sql = "SELECT COUNT(Q.Q_CODE) AS COUNT FROM QUIZ Q INNER JOIN USERINFO U "
				    +" ON Q.U_ID = U.U_ID ";
		
		boolean question = false;
		boolean type = false;
		boolean id = false;
		
		int insql = 1;
		int inpstmt = 1;
		
		if(quiz.getQ_type().length()>0){
			if(insql == 1){
			sql += " WHERE Q.Q_TYPE LIKE '%'||?||'%' "; 
			}else{
				sql += " AND Q.Q_TYPE LIKE '%'||?||'%' ";
			}
			insql++;
			type = true;
		}
		
		if(quiz.getQ_question().length()>0){
			if(insql == 1){
				sql += " WHERE Q.Q_QUESTION LIKE '%'||?||'%' "; 
			}else{
				sql += " AND Q.Q_QUESTION LIKE '%'||?||'%' ";
			}
			insql++;
			question = true;
		}
		
		if(quiz.getU_id().length()>0){
			if(insql == 1){
				sql += " WHERE Q.U_ID LIKE '%'||?||'%' "; 
			}else{
				sql += " AND Q.U_ID LIKE '%'||?||'%' ";
			}
			insql++;
			id = true;
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(type){
				pstmt.setString(inpstmt, quiz.getQ_type());
				inpstmt++;
			}
			
			if(question){
				pstmt.setString(inpstmt, quiz.getQ_question());
				inpstmt++;
			}
			
			if(id){
				pstmt.setString(inpstmt, quiz.getU_id());
				inpstmt++;
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return count;
	}
	public QuizInfoDTO searchQuizInfo(String qcode){
		QuizInfoDTO dto = new QuizInfoDTO();
		String sql = "SELECT Q_CODE , Q_QUESTION , Q_ANSWER , Q_WA_A , Q_WA_B , Q_WA_C , Q_TYPE FROM QUIZ WHERE Q_CODE = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qcode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setQ_code(rs.getString("q_code"));
				dto.setQ_type(rs.getString("q_type"));
				dto.setQ_question(rs.getString("q_question"));
				dto.setQ_answer(rs.getString("q_answer"));
				dto.setQ_wa_a(rs.getString("q_wa_a"));
				dto.setQ_wa_b(rs.getString("q_wa_b"));
				dto.setQ_wa_c(rs.getString("q_wa_c"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}		
		return dto;
	}
	
	public int updateQuiz(HashMap<String, String> map){
		int result = -1;
		String sql = "UPDATE QUIZ SET Q_TYPE = ? , Q_QUESTION = ? , Q_ANSWER = ? , Q_WA_A = ? , Q_WA_B = ? , Q_WA_C = ? WHERE Q_CODE = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("q_type"));
			pstmt.setString(2, map.get("q_question"));
			pstmt.setString(3, map.get("q_answer"));
			pstmt.setString(4, map.get("q_wa_a"));
			pstmt.setString(5, map.get("q_wa_b"));
			pstmt.setString(6, map.get("q_wa_c"));
			pstmt.setString(7, map.get("q_code"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int deleteQuiz(String id){
		int result = -1;
		String sql = "DELETE FROM QUIZ WHERE Q_CODE = ? ";
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
}
