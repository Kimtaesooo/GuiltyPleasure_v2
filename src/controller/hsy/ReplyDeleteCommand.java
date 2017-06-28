package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Reply;

public class ReplyDeleteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Reply dto2 = new Reply();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		dao.deleteReply(dto2.getR_reply());
		
		return "/CORDING/board/BoardRead.jsp?b_num="+dto2.getB_num();
	}
}
