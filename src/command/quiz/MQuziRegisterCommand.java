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


//운영자 퀴즈등록 command
public class MQuziRegisterCommand implements Command{
	
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp)throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		int i = dao.MRegiQuiz(dao.setQuiz(request));
		request.setAttribute("cmd", "MINSERT");
		if(i>0){
			System.out.println("문제가 들어갔습니다.");
			return "/CORDING/QuizRegi/RegiComplete.jsp";
		}
		return "/CORDING/QuizRegi/QuizReg.jsp";
	}
}
