package dao.boardmodule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.quiz.CommandFactory;
import controller.Command;

@WebServlet(urlPatterns="/borad")
public class Board extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		System.out.println("Board ¼­ºí¸´ ¿¬°á");
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		System.out.println("cmd"+cmd);
		
		String url = (String) command.processCommand(req, resp);
		RequestDispatcher dis = req.getRequestDispatcher(url);
		dis.forward(req, resp);
		
	}

}
