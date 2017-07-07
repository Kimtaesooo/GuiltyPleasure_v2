package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;
import dto.Reply;
/**
 * 
 * @author student
 * @version 1.0 2017.07.03
 */
public class ReplyDeleteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	Reply dto2 = new Reply();
	
	/**
	 * 댓글 삭제 처리 -> 글 상세보기 페이지
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String r_reply = req.getParameter("r_reply");
		String b_num = req.getParameter("b_num");
		
		dao.deleteReply(r_reply);
		dto = dao.getBoard(b_num, false);
		
		return "/CORDING/board/BoardRead.jsp?b_num="+dto.getB_num();
	}
}
