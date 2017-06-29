package controller.hsy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;

public class ListCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String keyfield = req.getParameter("keyfield");
		String keyword = req.getParameter("keyword");
		
		/*4.페이징을 위한 변수(페이지에서 받아오기)*/
		String nowPage = req.getParameter("nowPage");
		String nowBlock = req.getParameter("nowBlock");

		List<Board> BoardList = dao.getBoardList(keyword, keyfield);
		req.setAttribute("BoardList", BoardList);
		
		/*5.페이징을 위한 변수 (페이지에 보내기)*/
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		
		return "/CORDING/board/BoardList.jsp";
	}
}
