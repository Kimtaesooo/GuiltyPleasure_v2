package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;

public class UpdateQuizCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		
		int result = dao.updateQuiz(dao.setQuiz(req));
		req.setAttribute("cmd", "UPDATE");
		if(result == 1){
			return "/CORDING/QuizRegi/RegiComplete.jsp";
		}
		return "/CORDING/QuizRegi/QuizeInform.jsp";
	}

}
