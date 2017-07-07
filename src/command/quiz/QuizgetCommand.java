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
 * @author 김현수
 * 싱글게임을 할때 퀴즈를 db에서 가져오는 클래스
 * */
public class QuizgetCommand implements Command {
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String request에 포함된 method 파라미터에 따라 객관식 퀴즈게임, 주관식 퀴즈겜의 url주소를 반환, 오류시 싱글게임의 페이지 주소를 반환
	 * 
	 * @see GetQuiz db에 저장된 퀴즈를 가져오는 작업을 하는 클래스
	 * @see Quiz 퀴즈를 객체로 저장할 때 쓰이는 클래스
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO 퀴즈를 가져오는 클래스
		GetQuiz quiz = new GetQuiz();
		Quiz q = quiz.makeQuiz();
		req.setAttribute("quiz", q);
		String method = req.getParameter("method");
		req.setAttribute("method", method);
		if("SINGLE".equals(method)){
			return "/CORDING/Quiz/SinglePlay.jsp";
		}else if("SHORT".equals(method)){
			return "/CORDING/Quiz/ShortPlay.jsp";
		}
			return "/CORDING/Quiz/SingleStrart.html";
		
	}
}
