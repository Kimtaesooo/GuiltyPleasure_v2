package command.quizInfo;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizInfoDAO;

public class UpdateCommand implements Command {
	QuizInfoDAO dao = new QuizInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String,String> map = new HashMap<String, String>();

		map.put("q_code", request.getParameter("q_code"));
		map.put("q_type", request.getParameter("select"));
		map.put("q_question", URLDecoder.decode(request.getParameter("q_question"),"UTF-8"));
		map.put("q_wa_a", URLDecoder.decode(request.getParameter("q_wa_a"),"UTF-8"));
		map.put("q_wa_b", URLDecoder.decode(request.getParameter("q_wa_b"),"UTF-8"));
		map.put("q_wa_c", URLDecoder.decode(request.getParameter("q_wa_c"),"UTF-8"));
		map.put("q_answer", URLDecoder.decode(request.getParameter("q_answer"),"UTF-8"));
		
		int result = dao.updateQuiz(map);
		
		if(result != 1){
			return "";
		}
		
		
		return "WEB-INF/views/quizInfo/quizList.jsp";
	}

}
