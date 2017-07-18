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

public class GiveUpCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		// GuiltyPleasure/battle?cmd=GIVEUP&br_num="+br_num+"&giveUpUser="+giveUpUser+""
		String br_num = request.getParameter("br_num");
		String loser = request.getParameter("giveUpUser");
		String winner = "";
		String u_id = (String) session.getAttribute("u_id");
		
		BattlePlay battleplay = new BattlePlay(); //DAO
		List playinfo = battleplay.playInfo(br_num);
		List roominfo = battleplay.roomInfo(br_num);
		Battle_Play PlayDto = (Battle_Play) playinfo.get(0);
		Battle_Room RoomDto = (Battle_Room) roominfo.get(0);
		
		if(PlayDto.getUser01().equals(loser)){
			winner = PlayDto.getUser02();
		} else{
			winner = PlayDto.getUser01();
		}
		
		int point = RoomDto.getBr_point();
		
		battleplay.win(winner, point); // 승자 포인트 올려주고
		battleplay.lose(loser, point); // 패자 포인트 내려주고
		
		UserInfo userinfo = new UserInfo();
		Login login = new Login();
		userinfo = login.getUser(u_id);
		int nowPoint = userinfo.getU_point(); // 유저 현재 포인트 받아온다.
		
		request.setAttribute("winner", winner);
		request.setAttribute("loser", loser);
		request.setAttribute("nowPoint", nowPoint);

		// 방 정보 삭제(새로고침 포인트 획득 방지)
		battleplay.deletPlayRoom(br_num);
		
		
		
		
		return "/WEB-INF/views/battle/battleResult.jsp";
	}

}
