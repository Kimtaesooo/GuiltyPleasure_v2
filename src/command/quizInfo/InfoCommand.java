package command.quizInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizInfoDAO;
import dto.QuizInfoDTO;

public class InfoCommand implements Command {
	QuizInfoDAO dao = new QuizInfoDAO();
	QuizInfoDTO dto = new QuizInfoDTO();
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String qcode = request.getParameter("qcode");
		dto  = dao.searchQuizInfo(qcode);
		
		request.setAttribute("dto", dto);
		
		return "WEB-INF/views/quizInfo/quizInfo.jsp";
	}

}
