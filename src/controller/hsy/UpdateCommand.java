package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateCommand  implements CommandBoard{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//이동할 때 처리할 내용
		
		//입력값 확인
		
		//예외처리
		
		return "/CORDING/board/BoardUpdate.jsp";
	}
}