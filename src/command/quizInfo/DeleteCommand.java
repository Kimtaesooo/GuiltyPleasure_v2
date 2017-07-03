package command.quizInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizInfoDAO;

public class DeleteCommand implements Command {
	QuizInfoDAO dao = new QuizInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("q_code");
		System.out.println("comm id = "+id);
		int result = dao.deleteQuiz(id);
		if(result != 1){
			System.out.println("실패장소");
			return "";
		}		
		
		return "WEB-INF/quizInfo/quizInfo.jsp";
	}

}
