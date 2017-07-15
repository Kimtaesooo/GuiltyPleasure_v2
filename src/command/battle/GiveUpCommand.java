package command.battle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;

public class GiveUpCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String u_id = request.getParameter("u_id");
		String br_num = request.getParameter("br_num");
		
		return "/WEB-INF/views/battle/battleResult2.jsp?br_num="+br_num+"u_id="+u_id+"";
	}

}
