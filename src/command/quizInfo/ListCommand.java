package command.quizInfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizInfoDAO;
import dto.QuizInfoDTO;

public class ListCommand implements Command {
	QuizInfoDAO dao = new QuizInfoDAO();
	QuizInfoDTO dto = new QuizInfoDTO();
	
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		
		String u_id = request.getParameter("uid")==null?"":request.getParameter("uid");
		String q_type = request.getParameter("select")==null?"":request.getParameter("select");
		String q_question = request.getParameter("qquestion")==null?"":request.getParameter("qquestion");
		
		String order = request.getParameter("order")==null?"Q.Q_TYPE":request.getParameter("order");
		String pageno = request.getParameter("pageno")==null?"1":request.getParameter("pageno");
		
		if("".equals(pageno)){
			pageno = "1";
		}
		
		if("".equals(order)){
			order = "Q.Q_TYPE";
		}
		
		String orderType = request.getParameter("ordertype")==null?"asc":request.getParameter("ordertype");
		
		if("desc".equals(orderType)){
			order += " DESC";
		}
		
		dto.setU_id(u_id);
		dto.setQ_type(q_type);
		dto.setQ_question(q_question);
		
		ArrayList<QuizInfoDTO> list = dao.searchList(dto , 10, Integer.parseInt(pageno), order);
		int count = dao.listCount(dto);
		
		request.setAttribute("list", list);
		request.setAttribute("searchInfo", dto);
		request.setAttribute("ordertype", orderType);
		request.setAttribute("total", count);
		request.setAttribute("pageno", pageno);
		
		return "WEB-INF/quizInfo/quizList.jsp";
	}

}
