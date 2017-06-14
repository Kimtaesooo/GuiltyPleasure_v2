package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBConnectionMgr;
import dto.U_Quiz;

public class QuziRegisterCommand implements Command{
	U_Quiz uq;
	Connection con =null;
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String u_id = (String) request.getAttribute("u_id");
		try {
			DBConnectionMgr db = DBConnectionMgr.getInstance();
			con = db.getConnection();
			uq.setU_id(u_id);
			uq.setUq_answer(request.getParameter("textAnswer"));
			uq.setUq_wa_a(request.getParameter("w1"));
			uq.setUq_wa_b(request.getParameter("w2"));
			uq.setUq_wa_c(request.getParameter("w3"));
			uq.setQ_type(request.getParameter("genre"));
			uq.setUq_question(request.getParameter("textProblem"));
			int i = RegiQuiz(uq);
			if(i>0){
				System.out.println("문제가 들어갔습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("퀴즈등록 실패"+e);
		}
		return "/CORDING/QuizRegi/RegiComplete.html";
	}
	
	private int RegiQuiz(U_Quiz uq){
		PreparedStatement psmt;
		int i=0;
		String sql = "insert into U_QREG(UQ_NUM, U_ID, Q_TYPE, UQ_QUESTION, "
				+ "QU_ANSWER, UQ_WA_A, UQ_WA_B, UQ_WA_C,UQ_REGDATE, UQ_ADOPT) "
				+ "value(?,?,?,?,?,?,?,?,sysdate,'y')";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, 1);
			psmt.setString(2, uq.getU_id());
			psmt.setString(3, uq.getQ_type());
			psmt.setString(4, uq.getUq_question());
			psmt.setString(5, uq.getUq_answer());
			psmt.setString(6, uq.getUq_wa_a());
			psmt.setString(7, uq.getUq_wa_b());
			psmt.setString(8, uq.getUq_wa_c());
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("퀴즈 데이터를 넣는 과정에서 오류 발생"+e);
		}
		return i;
		
	}

}
