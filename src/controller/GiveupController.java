package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.quiz.CommandFactory;


@WebServlet(urlPatterns="/giveup")
public class GiveupController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cmd = req.getParameter("cmd");
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		String url = (String) command.processCommand(req, resp);
		System.out.println("url : "+url);
		RequestDispatcher dis = req.getRequestDispatcher(url);
		dis.forward(req, resp);
	}

	
}
