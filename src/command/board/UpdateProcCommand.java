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
public class UpdateProcCommand  implements CommandBoard{
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	/**
	 * 글 수정 처리 -> 글 상세보기 페이지
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String b_num = req.getParameter("b_num");
		String b_content = req.getParameter("b_content");
		String b_title = req.getParameter("b_title");
		
		
		dto.setB_title(b_title);
		dto.setB_content(b_content);
		dto.setB_num(b_num);
		
		dao.updateBoard(dto);

		return "/WEB-INF/views/board/BoardRead.jsp?b_num="+dto.getB_num();
	}
}