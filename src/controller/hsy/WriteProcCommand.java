package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;

public class WriteProcCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String u_id = req.getParameter("u_id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		String writeRead = dao.regBoard(u_id, title, content);
		req.setAttribute("writeRead", writeRead);
		return "/CORDING/board/BoardRead.jsp";
	}
}
