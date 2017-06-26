package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReadCommand  implements CommandBoard{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//boardread 이동할 때 처리할 내용
		
		//입력값 확인
		
		//예외처리
		
		return "/CORDING/board/BoardRead.jsp";
	}
}
