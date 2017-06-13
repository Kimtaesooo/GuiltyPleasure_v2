package controller.daon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

@WebServlet(urlPatterns = "/shop")
public class FrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("euc-kr");
		//넘겨오는 값 받아야지~
		String cmd = req.getParameter("cmd");
		String url = null;
		
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		String state = (String)req.getSession().getAttribute("STATE");
		System.out.println(state);
		if(state != null && state.equals("COMPLETE")){
			url = "/WEB-INF/CORDING/test.jsp";
		}
		else{
			url = (String)command.processCommand(req, resp);
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}

