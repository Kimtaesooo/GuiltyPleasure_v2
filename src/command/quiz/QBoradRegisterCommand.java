package command.quiz;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.QuizRegDAO;
import dto.U_Quiz;

/**
 * @author 김현수
 * 퀴즈 등록 게시판을 가져오는 클래스
 * */
public class QBoradRegisterCommand implements Command {

	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String 임시 퀴즈 등록 게시판의 주소를 반환
	 * 
	 * @see QuizRegDAO 퀴즈 등록에 필요한 db연결과 작업을 해주는 클래스
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("u_id");
	//	String power = req.getParameter("power"); 
		ArrayList<U_Quiz> list = new ArrayList<U_Quiz>();
		list = dao.getQBoard(id);
		req.setAttribute("Boardlist", list);
	
		return "/CORDING/QuizRegi/QuizRegBorad.jsp";		
	}
}
