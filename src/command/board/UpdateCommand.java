package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author 황선영
 * @version 1.0 2017.07.03
 */
public class UpdateCommand implements CommandBoard {
	/**
	 * 글 수정 페이지로 이동
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String b_num = req.getParameter("b_num");
		return "/WEB-INF/views/board/BoardUpdate.jsp?b_num="+b_num;
	}
}
