package command.battle;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.battlemodule.BattlePlay;
import dto.Battle_Room;

// 게임 방 생성
public class MakeRoomCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		Battle_Room dto = new Battle_Room();
		BattlePlay dao = new BattlePlay();

		String u_id = (String) session.getAttribute("u_id"); // 방 생성자 아이디 받아옴
		int br_cnt = Integer.parseInt(request.getParameter("br_cnt")); // 방 인원 수 받아옴
		
		// 배틀 대기방 생성 재료
		dto.setBr_subject(request.getParameter("br_subject")); // 제목
		dto.setBr_pw(Integer.parseInt(request.getParameter("br_pw"))); // 패스워드
		dto.setBr_type(request.getParameter("br_type")); // 퀴즈 유형
		dto.setBr_cnt(Integer.parseInt(request.getParameter("br_cnt"))); // 방 인원
		dto.setBr_point(Integer.parseInt(request.getParameter("br_point"))); // 배틀  포인트
		dto.setBr_ip(request.getParameter("br_ip")); // ip 주소

		// 배틀 대기방 생성
		dao.regRoom(dto, u_id);

		// 생성된 게임방 조회
		List roominfo = dao.roomInfo(u_id);
		Battle_Room room = (Battle_Room) roominfo.get(0);

		String br_num = room.getBr_num();

		// 배틀 플레이방 추가
		dao.playRoom(br_num, u_id, br_cnt);
		
		InetAddress local = InetAddress.getLocalHost();
		String ip = local.getHostAddress();
		
		session.setAttribute("bangjang", u_id); // 방장(방 생성자)
		session.setAttribute("br_num", br_num); // 방 번호
		session.setAttribute("br_cnt", br_cnt); // 문제 개수
		session.setAttribute("br_type", request.getParameter("br_type")); // 퀴즈 유형
		session.setAttribute("ip", ip); // ip
		

		//return "/WEB-INF/views/battle/playRoom.jsp?bangjang=" + u_id + "&br_num=" + br_num + "";
		return "/WEB-INF/views/battle/playRoom.jsp";
	}

}
