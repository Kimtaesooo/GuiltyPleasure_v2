package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author 황선영
 *
 */
public class ReadCommand  implements CommandBoard{
	
	/**
	 * 게시글 상세보기 페이지로 연결
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		return "/CORDING/board/BoardRead.jsp";
	}
}
