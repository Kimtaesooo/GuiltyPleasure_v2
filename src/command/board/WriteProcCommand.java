package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;
/**
 * 
 * @author 황선영
 * @version 1.0 2017.07.03
 */
public class WriteProcCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	/**
	 * 글 등록 처리 -> 글 상세보기 페이지
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String u_id = req.getParameter("u_id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		String writeRead = dao.regBoard(u_id, title, content);
		req.setAttribute("writeRead", writeRead);
		
		return "/CORDING/board/BoardRead.jsp";
	}
}
