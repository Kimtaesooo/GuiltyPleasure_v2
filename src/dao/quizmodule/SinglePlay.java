package dao.quizmodule;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.quiz.CommandFactory;
import controller.Command;
import dto.Quiz;

/**
 * @author 김현수
 * 싱글플레이 서블릿 클래스
 * */
@WebServlet(urlPatterns = "/quiz")
public class SinglePlay extends HttpServlet {
	Quiz q;
	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * 
	 * @see doPost post방식으로 처리하게끔 해주는 클래스
	 * */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * 
	 * @see QuizRegDAO 퀴즈 등록에 필요한 db연결과 작업을 해주는 클래스
	 * @see Quiz 퀴즈가 등록되는 객체 클래스
	 * */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		HttpSession session = req.getSession();
		String cmd = req.getParameter("cmd");
		ArrayList resultList = null;
		int counter = 0;
		String method= req.getParameter("method");
		if(req.getParameter("counter")!=null){
			counter = Integer.parseInt(req.getParameter("counter"));
			counter--;
			req.setAttribute("counter", counter);
		}
		
		//싱글 퀴즈 결과가 들어갈 리스트
		if(method.equals("SINGLE")){
			//객관식
			if(session.getAttribute("SingleResultlist") != null){
				resultList = (ArrayList) session.getAttribute("SingleResultlist");
			}else{
				resultList = new ArrayList();
			}
			
			if(cmd.equals("QUIZ_RESULT")){
				String[] result = req.getParameterValues("result");
				System.out.println("카운트 "+counter +"문제:"+result);
				resultList.add(result);
				session.setAttribute("SingleResultlist", resultList);
			}
		}else{
			//주관식
			if(session.getAttribute("ShortResultlist") != null){
				resultList = (ArrayList) session.getAttribute("ShortResultlist");
			}else{
				resultList = new ArrayList();
			}
			
			if(cmd.equals("QUIZ_RESULT")){
				String[] result = req.getParameterValues("result");
				resultList.add(result);
				session.setAttribute("ShortResultlist", resultList);
			}
		}
		
		
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
	
		String url = (String) command.processCommand(req, resp);
		Quiz q = (Quiz) req.getAttribute("quiz");
		
		req.setAttribute("quiz", q);
		
		RequestDispatcher dis = req.getRequestDispatcher(url);
		dis.forward(req, resp);
	}

}
