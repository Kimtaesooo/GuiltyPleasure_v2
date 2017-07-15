package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;


/**
 * �ӽ� ���� ��� �Խ����� ��� �����ϴ� Ŭ����
 * */
public class DeleteQuizCommand implements Command{
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String ��������� ������ο� ���� �Ϸ������� �Ǵ� �������� ������ �ּҸ� ��ȯ
	 * 
	 * @see QuizRegDAO ���� ��Ͽ� �ʿ��� db����� �۾��� ���ִ� Ŭ����
	 * */
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		QuizRegDAO dao = new QuizRegDAO();
		String qnum = req.getParameter("qnum");
		int result = -1;
		result = dao.deleteQuiz(qnum);
		req.setAttribute("cmd", "DELETE");
		if(result == 1){
			return "WEB-INF/views/QuizRegi/RegiComplete.jsp";
		}
		return "WEB-INF/views/QuizRegi/QuizeInform.jsp";
	}
}
