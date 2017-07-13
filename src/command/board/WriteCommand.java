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
public class WriteCommand implements CommandBoard {
	
	/**
	 * �� ���� �������� �̵�
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		return "/WEB-INF/views/board/BoardWrite.jsp";
	}
}
