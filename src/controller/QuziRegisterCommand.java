package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnectionMgr;
import dto.U_Quiz;


//퀴즈등록 command
public class QuziRegisterCommand implements Command{
	Connection con =null;
	HttpSession session;
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		session = request.getSession();
		U_Quiz uq = setQuiz(request);
		try {
			DBConnectionMgr db = DBConnectionMgr.getInstance();
			con = db.getConnection();
			int i = RegiQuiz(uq);
			if(i>0){
				System.out.println("문제가 들어갔습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/CORDING/QuizRegi/RegiComplete.jsp";
	}
	//db에 퀴즈 등록 메서드
	private int RegiQuiz(U_Quiz uq){
		PreparedStatement psmt;
		int i=0;
		String sql = "insert into U_QREG(UQ_NUM, U_ID, Q_TYPE, UQ_QUESTION, "
				+ "UQ_ANSWER, UQ_WA_A, UQ_WA_B, UQ_WA_C,UQ_REGDATE, UQ_ADOPT) "
				+ "VALUES(seq_uq_num.nextval ,?,?,?,?,?,?,?,sysdate,'y')";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uq.getU_id());
			psmt.setString(2, uq.getQ_type());
			psmt.setString(3, uq.getUq_question());
			psmt.setString(4, uq.getUq_answer());
			psmt.setString(5, uq.getUq_wa_a());
			psmt.setString(6, uq.getUq_wa_b());
			psmt.setString(7, uq.getUq_wa_c());
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("퀴즈 데이터를 넣는 과정에서 오류 발생");
			e.printStackTrace();
		}
		return i;
		
	}

	private U_Quiz setQuiz(HttpServletRequest request){
		U_Quiz uq = new U_Quiz();
		uq.setU_id((String) session.getAttribute("u_id"));
		uq.setUq_answer(request.getParameter("textAnswer"));
		uq.setUq_wa_a(request.getParameter("w1"));
		uq.setUq_wa_b(request.getParameter("w2"));
		uq.setUq_wa_c(request.getParameter("w3"));
		//uq.setQ_type(request.getParameter("genre"));
		uq.setQ_type("A");
		uq.setUq_question(request.getParameter("textProblem"));
		System.out.println("uq 확인" +uq.toString());
		
		return uq;
		
	}
}
