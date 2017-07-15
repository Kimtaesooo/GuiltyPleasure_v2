package command.quiz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Command;
import dao.quizmodule.GetQuiz;
import dto.Quiz;

/**
 * 
 * @author ������
 * �̱۰����� �Ҷ� ��� db���� �������� Ŭ����
 * */
public class QuizgetCommand implements Command {
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String request�� ���Ե� method �Ķ���Ϳ� ���� ������ �������, �ְ��� ������� url�ּҸ� ��ȯ, ������ �̱۰����� ������ �ּҸ� ��ȯ
	 * 
	 * @see GetQuiz db�� ����� ��� �������� �۾��� �ϴ� Ŭ����
	 * @see Quiz ��� ��ü�� ������ �� ���̴� Ŭ����
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO ��� �������� Ŭ����
		GetQuiz quiz = new GetQuiz();
		Quiz q = quiz.makeQuiz();
		req.setAttribute("quiz", q);
		String method = req.getParameter("method");
		req.setAttribute("method", method);
		if("SINGLE".equals(method)){
			return "/CORDING/Quiz/SinglePlay.jsp";
		}else if("SHORT".equals(method)){
			return "WEB-INF/views/Quiz/ShortPlay.jsp";
		}
			return "WEB-INF/views/Quiz/SingleStrart.html";
		
	}
}
