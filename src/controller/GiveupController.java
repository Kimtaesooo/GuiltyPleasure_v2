package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.quiz.CommandFactory;
import dao.QuizRegDAO;

/**
 * 게임포기를 처리하는 서블릿
 * @author 김현수
 * */

@WebServlet(urlPatterns="/giveup")
public class GiveupController extends HttpServlet{


	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @see RequestDispatcher cmd의 값에 따라 url을 받아와 url주소로 보내는 클래스
	 * */		
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
