package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;


/**
 * 임시 퀴즈 등록 게시판의 퀴즈를 삭제하는 클래스
 * */
public class DeleteQuizCommand implements Command{
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String 퀴즈삭제의 결과여부에 따라 완료페이지 또는 퀴즈정보 페이지 주소를 반환
	 * 
	 * @see QuizRegDAO 퀴즈 등록에 필요한 db연결과 작업을 해주는 클래스
	 * */
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		QuizRegDAO dao = new QuizRegDAO();
		String qnum = req.getParameter("qnum");
		int result = -1;
		result = dao.deleteQuiz(qnum);
		req.setAttribute("cmd", "DELETE");
		if(result == 1){
			return "/CORDING/QuizRegi/RegiComplete.jsp";
		}
		return "/CORDING/QuizRegi/QuizeInform.jsp";
	}
}
