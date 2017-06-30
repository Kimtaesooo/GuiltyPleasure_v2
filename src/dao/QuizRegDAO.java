package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dbcp.DBConnectionMgr;
import dto.U_Quiz;

public class QuizRegDAO {
	
	DBConnectionMgr pool = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	
	public QuizRegDAO(){
		pool = DBConnectionMgr.getInstance();
		try {
			conn = pool.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public U_Quiz setQuiz(HttpServletRequest request){
		U_Quiz uq = new U_Quiz();
		uq.setUq_num(request.getParameter("qnum"));		
		uq.setU_id(request.getSession().getAttribute("u_id").toString()==null?"":request.getSession().getAttribute("u_id").toString());
		uq.setUq_answer(request.getParameter("textAnswer"));
		uq.setUq_wa_a(request.getParameter("w1"));
		uq.setUq_wa_b(request.getParameter("w2"));
		uq.setUq_wa_c(request.getParameter("w3"));
		uq.setQ_type(request.getParameter("select"));
		uq.setUq_question(request.getParameter("textProblem"));
		System.out.println("uq 확인" +uq.toString());
		
		return uq;		
	}
	
	//db에 퀴즈 등록 메서드
	public int RegiQuiz(U_Quiz uq){
		int i=0;
		String sql = "insert into U_QREG(UQ_NUM, U_ID, Q_TYPE, UQ_QUESTION, "
				+ "UQ_ANSWER, UQ_WA_A, UQ_WA_B, UQ_WA_C,UQ_REGDATE, UQ_ADOPT) "
				+ "VALUES(seq_uq_num.nextval ,?,?,?,?,?,?,?,sysdate,'N')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uq.getU_id());
			pstmt.setString(2, uq.getQ_type());
			pstmt.setString(3, uq.getUq_question());
			pstmt.setString(4, uq.getUq_answer());
			pstmt.setString(5, uq.getUq_wa_a());
			pstmt.setString(6, uq.getUq_wa_b());
			pstmt.setString(7, uq.getUq_wa_c());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("퀴즈 데이터를 넣는 과정에서 오류 발생");
			e.printStackTrace();
		}
		System.out.println(i+" 건 들어감");
		return i;		
	}
	
	//운영자 퀴즈 등록 메서드
	public int MRegiQuiz(U_Quiz uq){		
		int i=0;
		String sql = "INSERT INTO QUIZ (Q_CODE, Q_TYPE, Q_QUESTION, Q_ANSWER, Q_CA_CNT, Q_WA_CNT, U_ID, Q_WA_A, Q_WA_B, Q_WA_C) "
				+ " VALUES ('Q'||LPAD(SEQ_Q_CODE.NEXTVAL, 9,'0'), ?,?,?,0,0,?,?,?,?) ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uq.getQ_type());
			pstmt.setString(2, uq.getUq_question());
			pstmt.setString(3, uq.getUq_answer());
			pstmt.setString(4, uq.getU_id());
			pstmt.setString(5, uq.getUq_wa_a());
			pstmt.setString(6, uq.getUq_wa_b());
			pstmt.setString(7, uq.getUq_wa_c());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("운영자 퀴즈 데이터를 넣는 과정에서 오류 발생");
			e.printStackTrace();
		}
		return i;		
	}
		
		// 퀴즈등록 게시판에 id로 해당하는 게 있는지 체크
		public String checkBoard(String id) {
			String confirm = "";
			try {
				String check = "select u_id from U_QREG where u_id =?";
				pstmt = conn.prepareStatement(check);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next() == true) {
					confirm = "있음";
				} else {
					confirm = "없음";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return confirm;
		}

		//게시판 클릭시 상세내용을 불러오는 메서드
		public U_Quiz getU_Quzi(String id){
			U_Quiz uqinform = new U_Quiz();
			String sql = "select * from U_QREG where UQ_NUM=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
					uqinform.setQ_type(rs.getString("Q_TYPE"));
					uqinform.setU_id(rs.getString("UQ_NUM"));
					uqinform.setUq_adopt(rs.getString("UQ_ADOPT"));
					uqinform.setUq_answer(rs.getString("UQ_ANSWER"));
					uqinform.setUq_num(rs.getString("UQ_NUM"));
					uqinform.setUq_question(rs.getString("UQ_QUESTION"));
					uqinform.setUq_regdate(rs.getString("UQ_REGDATE"));
					uqinform.setUq_wa_a(rs.getString("UQ_WA_A"));
					uqinform.setUq_wa_b(rs.getString("UQ_WA_B"));
					uqinform.setUq_wa_c(rs.getString("UQ_WA_C"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return uqinform;
		}
		
		
	// 전체 리스트를 가져오는 메서드
	public ArrayList<U_Quiz> getQBoard(String id) {
		// sql 2개 ; 하나는 유저가 접속했을때, 하나는 마스터가 접속했을때
		// 마스터가 접속했을땐 전 데이터 출력, 유저가 접속했을 땐 그 유저가 해당하는
	
		ArrayList<U_Quiz> qlist = new ArrayList<U_Quiz>();
		String sql;
		boolean master = true;
		if (!id.equals("master")){
			master = false;
		}
		try {
			//관리자일때	
			if(master){				
				sql = "select * from u_qreg  where uq_adopt = 'N' order by uq_adopt ";				
			}else{
				//유저이고 등록한 퀴즈가 몇개있을경우
				sql = "select * from u_qreg where u_id = ? order by uq_adopt";				
			}
			pstmt = conn.prepareStatement(sql);
			
			if(!master){
				pstmt.setString(1, id);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				U_Quiz uq = new U_Quiz();
				uq.setQ_type(rs.getString("Q_TYPE"));
				uq.setU_id(rs.getString("U_ID"));
				uq.setUq_adopt(rs.getString("UQ_ADOPT"));
				uq.setUq_answer(rs.getString("UQ_ANSWER"));
				uq.setUq_num(rs.getString("UQ_NUM"));
				uq.setUq_question(rs.getString("UQ_QUESTION"));
				uq.setUq_regdate(rs.getString("UQ_REGDATE"));
				uq.setUq_wa_a(rs.getString("UQ_WA_A"));
				uq.setUq_wa_b(rs.getString("UQ_WA_B"));
				uq.setUq_wa_c(rs.getString("UQ_WA_C"));
				qlist.add(uq);
			}
		} catch (SQLException e) {
			System.out.println("퀴즈등록 게시판을 리턴 못했을 경우" + e);
			e.printStackTrace();
		} finally {
	
		}
	
		return qlist;
	}
	
	//db에 퀴즈 수정 메서드
	public int updateQuiz(U_Quiz uq){
		
		int i=0;
		String sql = "UPDATE U_QREG SET Q_TYPE = ? , UQ_QUESTION = ? , "
				+ "UQ_ANSWER = ? , UQ_WA_A = ? , UQ_WA_B = ? , UQ_WA_C = ? WHERE  UQ_NUM = ? ";
				
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, uq.getQ_type());
			pstmt.setString(2, uq.getUq_question());
			pstmt.setString(3, uq.getUq_answer());
			pstmt.setString(4, uq.getUq_wa_a());
			pstmt.setString(5, uq.getUq_wa_b());
			pstmt.setString(6, uq.getUq_wa_c());
			pstmt.setString(7, uq.getUq_num());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("퀴즈 데이터를 넣는 과정에서 오류 발생");
			e.printStackTrace();
		}
		return i;		
	}
	
	public int deleteQuiz(String num){		
		int i=0;
		String sql = "DELETE FROM U_QREG WHERE UQ_NUM = ? ";
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, num);			
			i = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("퀴즈 데이터를 넣는 과정에서 오류 발생");
			e.printStackTrace();
		}
		return i;		
	}
	
	public int regQuiz(String num){
		int result = -1;
		int total = -1;
		U_Quiz quiz = getU_Quzi(num);
		String sql = "";
		sql = "UPDATE U_QREG SET UQ_ADOPT = 'Y' WHERE UQ_NUM = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			result = pstmt.executeUpdate();
			
			if(result != 1){
				conn.rollback();
				return total;				
			}
			
			sql = "INSERT INTO QUIZ (Q_CODE, Q_TYPE, Q_QUESTION, Q_ANSWER, Q_CA_CNT, Q_WA_CNT, U_ID, Q_WA_A, Q_WA_B, Q_WA_C) "
					+ " VALUES ('Q'||LPAD(SEQ_Q_CODE.NEXTVAL, 9,'0'), ?,?,?,0,0,?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, quiz.getQ_type());
			pstmt.setString(2, quiz.getUq_question());
			pstmt.setString(3, quiz.getUq_answer());
			pstmt.setString(4, quiz.getU_id());
			pstmt.setString(5, quiz.getUq_wa_a());
			pstmt.setString(6, quiz.getUq_wa_b());
			pstmt.setString(7, quiz.getUq_wa_c());
			total = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
}
