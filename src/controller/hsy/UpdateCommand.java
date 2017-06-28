package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;

public class UpdateCommand  implements CommandBoard{
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		dao.updateBoard(dto);
		
		return "/CORDING/board/BoardRead.jsp?b_num="+dto.getB_num();
	}
}