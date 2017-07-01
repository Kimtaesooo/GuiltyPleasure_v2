package command.ts_battle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.ts_battlemodule.BattlePlay;
import dto.Battle_Room;

// 게임방 생성
public class MakeRoomCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		
		HttpSession session = request.getSession();
		
		Battle_Room dto = new Battle_Room();
		BattlePlay dao = new BattlePlay();
		

		String u_id = (String)session.getAttribute("u_id");
		
		dto.setBr_subject(request.getParameter("br_subject"));
		dto.setBr_pw(Integer.parseInt(request.getParameter("br_pw")));
		dto.setBr_type(request.getParameter("br_type"));
		dto.setBr_cnt(Integer.parseInt(request.getParameter("br_cnt")));
		dto.setBr_point(Integer.parseInt(request.getParameter("br_point")));
		dto.setBr_ip(request.getParameter("br_ip"));

		// 배틀 대기방 생성
		dao.regRoom(dto, u_id);

		// 생성된 게임방 조회
		List roominfo = dao.roomInfo(u_id);
		Battle_Room room = (Battle_Room) roominfo.get(0);
		
		String br_num = room.getBr_num();
		u_id = room.getU_id();
		
		// 배틀 플레이방 추가
		dao.playRoom(br_num, u_id);
		
		
		
		return "/taesoo_battle/playRoom.jsp?bangjang="+u_id+"&br_num="+br_num+"";
	}

}
