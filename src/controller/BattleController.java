package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.battle.CommandFactory;

@WebServlet(urlPatterns = "/battle")
public class BattleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommandFactory instance;

	public BattleController() {
		super();
		instance = CommandFactory.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		String url = "";
		Command command = null;

		command = instance.createCommand(cmd);

		url = command.processCommand(request, response).toString();

		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
	}

}
