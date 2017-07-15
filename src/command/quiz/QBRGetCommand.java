package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;
import dto.U_Quiz;

/**
 * @author ������
 * ���� ���̵�� ��� ��ϵ� �����͸� �������� Ŭ����
 * */
public class QBRGetCommand implements Command {
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String db�� ������ ������ ����� ��ϵ� ���������� ������ �� ������� �����ִ� ������ url�� ��ȯ
	 * 
	 * @see QuizRegDAO ���� ��Ͽ� �ʿ��� db����� ���õ� �۾��� ���ִ� Ŭ����
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		// ���⼭ id�� �� ������ ��ȣ��
		String id = req.getParameter("id");
		
		U_Quiz uq = dao.getU_Quzi(id);
		req.setAttribute("uq", uq);
		return  "WEB-INF/views//QuizRegi/QuizeInform.jsp";
	}

}
