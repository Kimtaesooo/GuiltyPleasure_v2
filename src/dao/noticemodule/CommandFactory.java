package dao.noticemodule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
/**
 * 공지사항 커맨드 펙토리 클레스입니다.
 */
@WebServlet(urlPatterns = "/notice")
public class CommandFactory extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		/**
		 * 페이지 이동 메소드입니다.
		 * @param String cmd 사용자가 요청한 cmd 를 저장할 변수
		 * @param String url 이동될 페이지를 저장할 변수
		 */
		req.setCharacterEncoding("euc-kr");
		//명령어 가져오기
		String cmd = req.getParameter("cmd");
		String url = null;
		//명령어 리스트일때 이동
		if(cmd.equals("list")){
			url = "/CORDING/notice_board/n_list.jsp";
		}
		//글읽기시 글번호와 함께 전달
		else if(cmd.equals("read")){
			req.setAttribute("num", req.getParameter("num"));
			url = "/CORDING/notice_board/n_read.jsp";
		}
		//삭제시 글번호와 함께 전달
		else if(cmd.equals("delete")){
			req.setAttribute("num", req.getParameter("num"));
			url = "/CORDING/notice_board/n_delete.jsp";
		}
		//글 작성
		else if(cmd.equals("update")){
			url = "/CORDING/notice_board/n_update.jsp";
		}
		//글 등록
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

