package command.battle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.battlemodule.BattlePlay;
import dao.loginmodule.Login;
import dto.Battle_Play;
import dto.Battle_Room;
import dto.UserInfo;

public class ExitCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String br_num = request.getParameter("br_num");
		String u_id = (String) session.getAttribute("u_id");

		BattlePlay battleplay = new BattlePlay(); // 배틀 dao 
		List playinfo = battleplay.playInfo(br_num);
		List roomInfo2 = battleplay.roomInfo2(br_num);
		Battle_Play result1 = (Battle_Play) playinfo.get(0);
		Battle_Room result2 = (Battle_Room) roomInfo2.get(0);
		String user01 = result1.getUser01(); // 유저1 아이디
		String user02 = result1.getUser02(); // 유저2 아이디
		int bp_01cnt = result1.getBp_01cnt(); // 유저1 정답수
		int bp_02cnt = result1.getBp_02cnt(); // 유저2 정답수
		int point = result2.getBr_point(); // 방 생성 때 정한 포인트
		

		String winner = (bp_01cnt > bp_02cnt) ? user01 : user02; // 맞춘 수 비교하여 승자 결정
		String loser = (bp_01cnt > bp_02cnt) ? user02 : user01;  // 맞춘 수 비교하여 패자 결정

		battleplay.win(winner, point); // 승자 포인트 올려주고
		battleplay.lose(loser, point); // 패자 포인트 내려주고

		// 유저 정보 얻어 오는거임..
		UserInfo userinfo = new UserInfo();
		Login login = new Login();
		userinfo = login.getUser(u_id);
		int nowPoint = userinfo.getU_point(); // 유저 현재 포인트 받아온다.

		request.setAttribute("winner", winner);
		request.setAttribute("loser", loser);
		request.setAttribute("user01", user01);
		request.setAttribute("user02", user02);
		request.setAttribute("point", point);
		request.setAttribute("nowPoint", nowPoint);
		
		
		// 방 정보 삭제(새로고침 포인트 획득 방지)
		battleplay.deletPlayRoom(br_num);
		
		
		return "/WEB-INF/views/battle/battleResult.jsp";
	}

}
