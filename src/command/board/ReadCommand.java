package command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author Ȳ����
 *
 */
public class ReadCommand  implements CommandBoard{
	
	/**
	 * �Խñ� �󼼺��� �������� ����
	 */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		return "/CORDING/board/BoardRead.jsp";
	}
}
