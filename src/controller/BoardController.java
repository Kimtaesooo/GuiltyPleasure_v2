package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.CommandBoard;
import command.board.CommandFactory;
/**
 * 
 * @author È²¼±¿µ
 * @version 1.0 2017.07.03
 */
@WebServlet(urlPatterns="/Board")
public class BoardController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String cmd = req.getParameter("cmd");
		String url = null;
		CommandFactory factory = CommandFactory.newInstance();
		CommandBoard command = factory.createCommand(cmd);
		String state = (String)req.getSession().getAttribute("STATE");
		url = (String)command.processCommand(req, resp);
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
