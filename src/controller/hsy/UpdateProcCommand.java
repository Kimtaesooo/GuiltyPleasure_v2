package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;

public class UpdateProcCommand  implements CommandBoard{
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String b_num = req.getParameter("b_num");
		String b_content = req.getParameter("b_content");
		String b_title = req.getParameter("b_title");
		
		
		dto.setB_title(b_title);
		dto.setB_content(b_content);
		dto.setB_num(b_num);
		
		dao.updateBoard(dto);

		return "/CORDING/board/BoardRead.jsp?b_num="+dto.getB_num();
	}
}