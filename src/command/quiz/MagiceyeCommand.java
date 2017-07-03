package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;
import dao.quizmodule.GetPoint;

/**
 * 매직아이게임을 하고 포인트를 적립할때 사용되는 클래스
 * @see GetPoint 포인트를 적립하는 기능이 있는 클래스*/
public class MagiceyeCommand implements Command{
	GetPoint point = new GetPoint();
	
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * 
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		int i = point.SavePoint(id);
		if(i!=0){
			System.out.println("정답");
			return "/CORDING/magic/magicEyePlay.jsp";
		}else{
			return "/CORDING/magic/magicEyePlay.jsp";
		}
	}
	
	
}
