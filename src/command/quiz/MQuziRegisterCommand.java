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
 * 운영자 입장에서 문제를 등록하는 클래스
 * */
public class MQuziRegisterCommand implements Command{
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String DB등록 여부에따라 등록완료페이지와 페이지 등록전 페이지주소를 반환
	 * 
	 * @see QuizRegDAO 퀴즈 등록에 필요한 db연결과 작업을 해주는 클래스
	 * */
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp)throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		int i = dao.MRegiQuiz(dao.setQuiz(request));
		request.setAttribute("cmd", "MINSERT");
		if(i>0){
			return "/CORDING/QuizRegi/RegiComplete.jsp";
		}
		return "/CORDING/QuizRegi/QuizReg.jsp";
	}
}
