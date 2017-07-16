package command.battle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.battlemodule.BattlePlay;

public class BattlePageCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		
		BattlePlay dao = new BattlePlay();
		List list = dao.getListRoom();
		
		
		session.setAttribute("list", list);
		session.setAttribute("ip", request.getRemoteAddr());
		return "/WEB-INF/views/battle/battleRoom.jsp";
	}

}
