package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.quiz.CommandFactory;

/**
 * 매직아이 게임을 관리하는 서블릿
 * @author 김현수
 * */
@WebServlet(urlPatterns="/magic")
public class MagicController extends HttpServlet {
	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @see doGet GET방식의 처리를 하는 메서드
	 * @see RequestDispatcher cmd의 값에 따라 url을 받아와 url주소로 보내는 클래스
	 * */		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	/**
	 * @see doPost POST방식으로 온 결과를 처리하는 메서드
	 * */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		
		String url = command.processCommand(req, resp).toString();
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
