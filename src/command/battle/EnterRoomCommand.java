package command.battle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import controller.Command;
import dao.battlemodule.BattlePlay;
import dto.Battle_Play;
import dto.Battle_Room;

public class EnterRoomCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		// battleRoom에서 가져온 정보들
		String bangjang = request.getParameter("bangjang");
		String br_num = request.getParameter("br_num");
		String br_type = request.getParameter("br_type");
		String u_id = request.getParameter("u_id");

		// dto, dao 선언
		List roominfo = new ArrayList();
		List playinfo = new ArrayList();
		BattlePlay dao = new BattlePlay();

		roominfo = dao.roomInfo2(br_num); // 방에 대한 정보(battleroom) - 문제개수, 유형 등등
		Battle_Room battleroom = (Battle_Room) roominfo.get(0);

		playinfo = dao.playInfo(br_num); // 방에 속한 유저들의 정보(playroom) - 방장ID,
											// 유저ID, 정답 카운팅 등
		Battle_Play battleplay = (Battle_Play) playinfo.get(0);

		if (battleroom.getBr_people() == 2) {
			return "/WEB-INF/views/battle/battleRoom.jsp";
		}
		
		if (battleroom.getBr_people() == 1) {
			dao.updatePlayRoom(br_num, u_id);
		}

		int people = battleroom.getBr_people();

		System.out.println(br_num);
		System.out.println(bangjang);
		System.out.println(br_type);

		session.setAttribute("bangjang", bangjang); // 방장(방 생성자)
		session.setAttribute("br_num", br_num); // 방장(방 생성자)
		session.setAttribute("br_type", br_type); // 방장(방 생성자)

		// return "/WEB-INF/views/battle/battleResult.jsp?br_num="+br_num+"";
		return "/WEB-INF/views/battle/playRoom.jsp";
	}

}
