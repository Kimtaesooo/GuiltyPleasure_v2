package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;
import dto.Reply;

public class ReplyCommand implements CommandBoard{
	FreeBoard dao = new FreeBoard();
	Reply dto2 = new Reply();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String b_num = req.getParameter("b_num");
		String u_id = req.getParameter("u_id");
		String r_content = req.getParameter("r_content");
		String r_regdate = req.getParameter("r_regdate");
		
		dto2.setB_num(b_num);
		dto2.setU_id(u_id);
		dto2.setR_content(r_content);
		dto2.setR_regdate(r_regdate);
		
		dao.replyBoard(dto2);
		
		return "/CORDING/board/BoardRead.jsp?b_num="+dto2.getB_num();
	}
}
