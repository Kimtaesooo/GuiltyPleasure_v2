package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;
import dto.U_Quiz;

public class QBRGetCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		// 여기서 id는 글 시퀀스 번호임
		String id = req.getParameter("id");
		
		U_Quiz uq = dao.getU_Quzi(id);
		req.setAttribute("uq", uq);
		return  "/CORDING/QuizRegi/QuizeInform.jsp";
	}

}
