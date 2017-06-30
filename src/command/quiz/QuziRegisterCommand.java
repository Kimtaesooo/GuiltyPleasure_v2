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


//유저 퀴즈등록 command
public class QuziRegisterCommand implements Command{
	
	
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
