package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;

/**
 * @author ������
 * �ӽ� ������ ���̺��� �������� ��� ��ϵǵ��� ���ִ� Ŭ����
 * */
public class RegQuizCommand implements Command{

	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String DB�� �����͸� �Է����� �Ϸ������� Ȥ��, ��ϵ� ������ ����â���� �̵��ϴ� url�ּҸ� ��ȯ
	 * @see QuizRegDAO db�� �ִ� �ӽ� ���� ��� ���̺� �����Ҷ��� �����ö� ���Ǵ� Ŭ����
	 * */		
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		QuizRegDAO dao = new QuizRegDAO();
		String qnum = req.getParameter("qnum");
		int result = -1;
		result = dao.regQuiz(qnum);
		req.setAttribute("cmd", "REG");
		if(result == 1){
			return "WEB-INF/views/QuizRegi/RegiComplete.jsp";
		}
		return "WEB-INF/views/QuizRegi/QuizeInform.jsp";
	}

}
