package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.login.CommandFactory;

@WebServlet(urlPatterns = "/logcheck")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommandFactory instance;

	public LoginController() {
		super();
		instance = CommandFactory.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String cmd = request.getParameter("cmd");
		String url = "";
		Command command = null;

		// 로그인 페이지 이동
		if (cmd.equals("loginpage")) {
			url = "/WEB-INF/views/login/login.jsp";
			RequestDispatcher view = request.getRequestDispatcher(url);
			view.forward(request, response);
			return;
		}
		// 로그아웃 페이지 이동
		else if (cmd.equals("logoutpage")) {
			url = "/WEB-INF/views/login/logout.jsp";
			RequestDispatcher view = request.getRequestDispatcher(url);
			view.forward(request, response);
			return;
		// 아이디, 패스워드 찾기 페이지
		} else if (cmd.equals("resistrationpage")) {
			url = "/WEB-INF/views/login/resistration.jsp";
			RequestDispatcher view = request.getRequestDispatcher(url);
			view.forward(request, response);
			return;
		}
		command = instance.createCommand(cmd);

		url = command.processCommand(request, response).toString();

		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
	}
}