package controller.hsy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;

public class ListCommand implements CommandBoard {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		FreeBoard dao = FreeBoard.getInstance();
		List BoardList = dao.getBoardList(null, null);
		req.setAttribute("BoardList", BoardList);
		
		return "/CORDING/board/BoardList.jsp";
	}
}
