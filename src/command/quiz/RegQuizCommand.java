package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;

public class RegQuizCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		QuizRegDAO dao = new QuizRegDAO();
		String qnum = req.getParameter("qnum");
		int result = -1;
		result = dao.regQuiz(qnum);
		req.setAttribute("cmd", "REG");
		if(result == 1){
			return "/CORDING/QuizRegi/RegiComplete.jsp";
		}
		return "/CORDING/QuizRegi/QuizeInform.jsp";
	}

}
