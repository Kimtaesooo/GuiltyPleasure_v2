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
public class WriteCommand implements CommandBoard {
	
	/**
	 * 글 쓰기 페이지로 이동
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		return "/WEB-INF/views/board/BoardWrite.jsp";
	}
}
