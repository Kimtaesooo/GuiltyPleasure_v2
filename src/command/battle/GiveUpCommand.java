package command.battle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;

public class GiveUpCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		String u_id = request.getParameter("u_id");
		String br_num = request.getParameter("br_num");
		
		return "/CORDING/battle/battleResult2.jsp?br_num="+br_num+"u_id="+u_id+"";
	}

}
