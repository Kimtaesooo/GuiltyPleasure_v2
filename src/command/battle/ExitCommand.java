package command.battle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;

public class ExitCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String br_num = request.getParameter("br_num");
		
		return "/WEB-INF/views/battle/battleResult.jsp?br_num="+br_num+"";
	}

}
