package controller.hsy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.boardmodule.FreeBoard;
import dto.Board;

public class DeleteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String b_num = req.getParameter("b_num");
		dao.deleteBoard(b_num);
		
		String keyfield ="";
		String keyword ="";
		List<Board> BoardList = dao.getBoardList(keyword, keyfield);
		req.setAttribute("BoardList", BoardList);
		
		req.setAttribute("nowPage", 0);
		req.setAttribute("nowBlock", 0);
	
		return "/CORDING/board/BoardList.jsp";
	}
}
