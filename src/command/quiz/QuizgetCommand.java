package command.quiz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Command;
import dao.quizmodule.GetQuiz;
import dto.Quiz;

public class QuizgetCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 퀴즈를 가져오는 클래스
		GetQuiz quiz = new GetQuiz();
		Quiz q = quiz.makeQuiz();
		req.setAttribute("quiz", q);
		return "/CORDING/Quiz/SinglePlay.jsp";
	}
}
