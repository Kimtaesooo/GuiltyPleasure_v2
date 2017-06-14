package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.quizmodule.GetQuiz;
import dto.QuizResult;

public class QuizResultCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String u_id = (String) session.getAttribute("u_id");
		QuizResult re;
		GetQuiz gq = new GetQuiz();
		String[] array;
		ArrayList Qarray = new ArrayList();
		if("FINAL" .equals(req.getParameter("step"))){
		ArrayList list = (ArrayList) session.getAttribute("resultlist");
		for (int i = 0; i < list.size(); i++) {
			String[] str = (String[]) list.get(i);
			System.out.println(str[0]);
			array = str[0].split(",");
			
			re = new QuizResult();
			re.setQ_code(array[0]);
			re.setQ_type(array[1]);
			if(array[2].equals("o")){
				re.setQ_ca_count(1);
			}else{
				re.setQ_wa_count(1);
			}
			re.setU_id(u_id);
			Qarray.add(re);
			
			session.removeAttribute("resultlist");
		}
		req.setAttribute("list", Qarray);
		gq.setResult(Qarray);
			return "/CORDING/Quiz/SingleResult.jsp";
		}else{
			return new QuizgetCommand().processCommand(req, resp) ;
		}
	}

}
