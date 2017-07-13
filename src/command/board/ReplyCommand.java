package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;
import dto.Board;
import dto.Reply;
/**
 * 
 * @author Ȳ����
 * @version 1.0 2017.07.03
 */
public class ReplyCommand implements CommandBoard{
	FreeBoard dao = new FreeBoard();
	Reply dto2 = new Reply();
	
	/**
	 * ��� ��� ó�� -> �� �󼼺��� ������
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		// ��� ����� ���� �ʿ��� ���� �ޱ� - �� ��ȣ, �������̵�, ��� ����, ��� ��Ͻð�
		String b_num = req.getParameter("b_num");
		String u_id = req.getParameter("u_id");
		String r_content = req.getParameter("r_content");
		String r_regdate = req.getParameter("r_regdate");
		
		// refresh�ص� �۾��� �ѹ� �� ó������ �ʱ� ���� ó��
		String before_u_id = req.getSession().getAttribute("u_id")==null?"":req.getSession().getAttribute("u_id").toString();
		String before_b_num = req.getSession().getAttribute("b_num")==null?"":req.getSession().getAttribute("b_num").toString();
		String before_r_content = req.getSession().getAttribute("r_content")==null?"":req.getSession().getAttribute("r_content").toString();
		
		if(before_u_id.equals(u_id) && before_b_num.equals(b_num) && before_r_content.equals(r_content)){
			return "/WEB-INF/views/board/BoardRead.jsp?b_num="+b_num;
		}
		
		// ��� ��� ��� �� �������� �����ֱ� ���� ó��
		dto2.setB_num(b_num);
		dto2.setU_id(u_id);
		dto2.setR_content(r_content);
		dto2.setR_regdate(r_regdate);
		
		dao.replyBoard(dto2);
		
		req.getSession().setAttribute("b_num", b_num);
		req.getSession().setAttribute("u_id", u_id);
		req.getSession().setAttribute("r_content", r_content);
		
		return "/WEB-INF/views/board/BoardRead.jsp?b_num="+dto2.getB_num();
	}
}
