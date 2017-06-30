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

//퀴즈 등록 게시판을 가져온다
public class QBoradRegisterCommand implements Command {

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
