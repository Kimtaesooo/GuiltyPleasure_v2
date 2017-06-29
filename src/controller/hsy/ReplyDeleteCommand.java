package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;
import dto.Reply;

public class ReplyDeleteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	Reply dto2 = new Reply();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String r_reply = req.getParameter("r_reply");
		String b_num = req.getParameter("b_num");
		
		dao.deleteReply(r_reply);
		dto = dao.getBoard(b_num, false);
		
		return "/CORDING/board/BoardRead.jsp?b_num="+dto.getB_num();
	}
}
