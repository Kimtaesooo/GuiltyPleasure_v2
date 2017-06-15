package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.QBorad;
import dto.U_Quiz;

public class QBRGetCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		QBorad qb = new QBorad();
		U_Quiz uq = qb.getU_Quzi(id);
		req.setAttribute("uq", uq);
		return  "/CORDING/QuizRegi/QuizInform.jsp";
	}

}
