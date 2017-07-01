package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.quizInfo.CommandFactory;

/**
 * Servlet implementation class QuizInfoController
 */
@WebServlet(urlPatterns="/quizinfo")
public class QuizInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommandFactory instance;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizInfoController() {
       	instance = CommandFactory.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("euc-kr");
		
		String cmd = request.getParameter("cmd");
		String url = "";
		Command command = null;
		command = instance.createCommand(cmd);	
		
		url = command.processCommand(request, response).toString();
		
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
	}

}
