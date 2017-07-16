package dao.quizmodule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import command.quiz.CommandFactory;

/**
 * Servlet implementation class QuizRegister
 */
@WebServlet("/QuizRegister")
public class QuizRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		String url = (String) command.processCommand(request, response);
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
	}
}
