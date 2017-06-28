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
		// 여기서 id는 글 시퀀스 번호임
		String id = req.getParameter("id");
		QBorad qb = new QBorad();
		U_Quiz uq = qb.getU_Quzi(id);
		req.setAttribute("uq", uq);
		return  "/CORDING/QuizRegi/QuizeInform.jsp";
	}

}
