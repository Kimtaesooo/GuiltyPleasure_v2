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
public class ListCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	Board dto = new Board();
	
	/**
	 * 게시글 리스트 가져와서 화면에 뿌리기 위한 처리 -> 리스트 페이지
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		//검색 기능을 위한 변수 받기
		String keyfield = req.getParameter("keyfield");
		String keyword = req.getParameter("keyword");
		
		/*4.페이징을 위한 변수(페이지에서 받아오기)*/
		String nowPage = req.getParameter("nowPage");
		String nowBlock = req.getParameter("nowBlock");

		List<Board> BoardList = dao.getBoardList(keyword, keyfield);
		req.setAttribute("BoardList", BoardList);
		
		/*5.페이징을 위한 변수 (페이지에 보내기)*/
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		
		return "/WEB-INF/views/board/BoardList.jsp";
	}
}
