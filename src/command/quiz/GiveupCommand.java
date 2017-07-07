package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.QuizRegDAO;


/**
 * 싱글게임에서 포기버튼을 누를시 기존에 저장된 게임결과를 삭제하고 이동할 페이지를 정해주는 클래스
 * @author 김현수
 * */
public class GiveupCommand implements Command{

	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String 게임을 포기하고 메인페이지의 주소를 반환
	 * 
	 * @see session 게임에서 기록된 결과를 가지고있는 session
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		session.removeAttribute("ShortResultlist");
		session.removeAttribute("SingleResultlist");
		return "/main.jsp";
	}

}
