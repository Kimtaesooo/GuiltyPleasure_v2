package command.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.QuizRegDAO;
import dto.U_Quiz;

/**
 * @author 김현수
 * 유저가 퀴즈를 등록할때 거치는 클래스
 * */
public class QuziRegisterCommand implements Command{
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String DB에 데이터를 입력한후 완료페이지 혹은, 다시 등록페이지로 이동하는 url주소를 반환
	 * @see QuizRegDAO db에 있는 임시 퀴즈 등록 테이블에 저장할때나 가져올때 사용되는 클래스
	 * */		
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp)throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		int i = dao.RegiQuiz(dao.setQuiz(request));
		request.setAttribute("cmd", "INSERT");
		if(i>0){
			return "/CORDING/QuizRegi/RegiComplete.jsp";
		}
		return "/CORDING/QuizRegi/QuizReg.jsp";
	}
	
}
