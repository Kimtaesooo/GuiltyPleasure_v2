package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.boardmodule.QBorad;

//퀴즈 등록 게시판을 가져온다
public class QBoradRegisterCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("u_id");
	//	String power = req.getParameter("power"); 
		ArrayList list = new ArrayList<>();
		QBorad qb = new QBorad();
		list = qb.getQBoard(id);
		req.setAttribute("Boardlist", list);
		return "/CORDING/QuizRegi/QuizRegBorad.jsp";
	}

}
