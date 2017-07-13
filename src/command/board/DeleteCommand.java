package command.board;

import java.io.IOException;
import java.util.List;

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
public class DeleteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	
	/**
	 * 게시글을 DB에서 삭제하기 위한 처리 -> 리스트 페이지
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		//삭제 처리
		String b_num = req.getParameter("b_num");
		dao.deleteBoard(b_num);
		
		//변경사항을 적용하여 게시글 리스트 뿌리기
		String keyfield ="";
		String keyword ="";
		List<Board> BoardList = dao.getBoardList(keyword, keyfield);
		req.setAttribute("BoardList", BoardList);
		
		//페이징을 위한 변수 (페이지에 보내기)
		req.setAttribute("nowPage", 0);
		req.setAttribute("nowBlock", 0);
	
		return "/WEB-INF/views/board/BoardList.jsp";
	}
}
