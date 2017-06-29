package dao.noticemodule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

@WebServlet(urlPatterns = "/notice")
public class CommandFactory extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("euc-kr");
		//넘겨오는 값 받아야지~
		String cmd = req.getParameter("cmd");
		String url = null;
		
		if(cmd.equals("list")){
			url = "/CORDING/notice_board/n_list.jsp";
		}
		else if(cmd.equals("read")){
			req.setAttribute("num", req.getParameter("num"));
			url = "/CORDING/notice_board/n_read.jsp";
		}
		else if(cmd.equals("delete")){
			req.setAttribute("num", req.getParameter("num"));
			url = "/CORDING/notice_board/n_delete.jsp";
		}
		else if(cmd.equals("update")){
			url = "/CORDING/notice_board/n_update.jsp";
		}
		else if(cmd.equals("reg")){
			req.setAttribute("title", req.getParameter("title"));
			req.setAttribute("type", req.getParameter("type"));
			req.setAttribute("content", req.getParameter("content"));
			url = "/CORDING/notice_board/n_ques_proc.jsp";
		}
		else{
			
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}

