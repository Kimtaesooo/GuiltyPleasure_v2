package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;
/**
 * 
 * @author Ȳ����
 * @version 1.0 2017.07.03
 */
public class WriteProcCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	/**
	 * �� ��� ó�� -> �� �󼼺��� ������
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String u_id = req.getParameter("u_id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		String writeRead = dao.regBoard(u_id, title, content);
		req.setAttribute("writeRead", writeRead);
		
		return "/WEB-INF/views/board/BoardRead.jsp";
	}
}
