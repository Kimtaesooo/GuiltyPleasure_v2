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
 * @author Ȳ����
 * @version 1.0 2017.07.03
 */
public class DeleteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	
	/**
	 * �Խñ��� DB���� �����ϱ� ���� ó�� -> ����Ʈ ������
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		//���� ó��
		String b_num = req.getParameter("b_num");
		dao.deleteBoard(b_num);
		
		//��������� �����Ͽ� �Խñ� ����Ʈ �Ѹ���
		String keyfield ="";
		String keyword ="";
		List<Board> BoardList = dao.getBoardList(keyword, keyfield);
		req.setAttribute("BoardList", BoardList);
		
		//����¡�� ���� ���� (�������� ������)
		req.setAttribute("nowPage", 0);
		req.setAttribute("nowBlock", 0);
	
		return "/CORDING/board/BoardList.jsp";
	}
}
