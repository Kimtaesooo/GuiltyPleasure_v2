package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;

/**
 * @author 김현수
 * 임시 퀴즈등록 테이블에서 정식으로 퀴즈가 등록되도록 해주는 클래스
 * */
public class RegQuizCommand implements Command{

	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String DB에 데이터를 입력한후 완료페이지 혹은, 등록된 퀴즈의 정보창으로 이동하는 url주소를 반환
	 * @see QuizRegDAO db에 있는 임시 퀴즈 등록 테이블에 저장할때나 가져올때 사용되는 클래스
	 * */		
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
