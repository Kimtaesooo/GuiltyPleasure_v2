package command.battle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.battlemodule.BattlePlay;
import dto.Battle_Room;

// ���ӹ� ����
public class MakeRoomCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		Battle_Room dto = new Battle_Room();
		BattlePlay dao = new BattlePlay();
		

		String u_id = (String)session.getAttribute("u_id"); // �� ������ ���̵� �޾ƿ�
		int br_cnt = Integer.parseInt(request.getParameter("br_cnt")); // �� �ο��� �޾ƿ�
		
		dto.setBr_subject(request.getParameter("br_subject")); // ����
		dto.setBr_pw(Integer.parseInt(request.getParameter("br_pw"))); // �н�����
		dto.setBr_type(request.getParameter("br_type")); // ���� ����
		dto.setBr_cnt(Integer.parseInt(request.getParameter("br_cnt")));  // �� �ο�
		dto.setBr_point(Integer.parseInt(request.getParameter("br_point"))); // ��Ʋ ����Ʈ
		dto.setBr_ip(request.getParameter("br_ip")); // ip �ּ�

		// ��Ʋ ���� ����
		dao.regRoom(dto, u_id);

		// ������ ���ӹ� ��ȸ
		List roominfo = dao.roomInfo(u_id);
		Battle_Room room = (Battle_Room) roominfo.get(0);
		
		String br_num = room.getBr_num();
		u_id = room.getU_id();
		
		// ��Ʋ �÷��̹� �߰�
		dao.playRoom(br_num, u_id, br_cnt);
		
		
		
		return "/WEB-INF/views/battle/playRoom.jsp?bangjang="+u_id+"&br_num="+br_num+"";
	}

}
