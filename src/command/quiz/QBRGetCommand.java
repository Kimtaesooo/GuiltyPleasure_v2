package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;
import dto.U_Quiz;

/**
 * @author 김현수
 * 유저 아이디로 퀴즈가 등록된 데이터를 가져오는 클래스
 * */
public class QBRGetCommand implements Command {
	/**
	 * @param HttpServletRequest 요청한 페이지의 request변수
	 * @param HttpServletResponse 요청한 페이지의 response변수
	 * @return String db에 퀴즈의 정보를 등록후 등록된 퀴즈정보를 가지고 그 퀴즈에대해 보여주는 페이지 url을 반환
	 * 
	 * @see QuizRegDAO 퀴즈 등록에 필요한 db연결과 관련된 작업을 해주는 클래스
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		// 여기서 id는 글 시퀀스 번호임
		String id = req.getParameter("id");
		
		U_Quiz uq = dao.getU_Quzi(id);
		req.setAttribute("uq", uq);
		return  "/CORDING/QuizRegi/QuizeInform.jsp";
	}

}
