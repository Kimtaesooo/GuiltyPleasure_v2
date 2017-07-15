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
 * �������⸦ ó���ϴ� ����
 * 
 * @author ������
 */

@WebServlet(urlPatterns = "/giveup")
public class GiveupController extends HttpServlet {

	/**
	 * @param HttpServletRequest
	 *            ��û�� �������� request����
	 * @param HttpServletResponse
	 *            ��û�� �������� response����
	 * @see RequestDispatcher cmd�� ���� ���� url�� �޾ƿ� url�ּҷ� ������ Ŭ����
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String cmd = req.getParameter("cmd");

		// 싱글게임 메인 페이지 이동
		if (cmd.equals("singlepage")) {
			String url = "/WEB-INF/views/Quiz/SingleMain.jsp";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
			return;
			// 퀴즈등록 페이지 이동
		} else if (cmd.equals("inregquiz")) {
			String url = "/WEB-INF/views/QuizRegi/QuizRegInfo.jsp";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
			return;
		} else if (cmd.equals("inmagic")) {
			String url = "/WEB-INF/views/magic/magicEyeStart.jsp";
			RequestDispatcher view = req.getRequestDispatcher(url);
			view.forward(req, resp);
			return;
		}

		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		String url = (String) command.processCommand(req, resp);
		RequestDispatcher dis = req.getRequestDispatcher(url);
		dis.forward(req, resp);
	}

}
