package command.quiz;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.QuizRegDAO;
import dto.U_Quiz;

/**
 * @author ������
 * ������ ��� ����Ҷ� ��ġ�� Ŭ����
 * */
public class QuziRegisterCommand implements Command{
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String DB�� �����͸� �Է����� �Ϸ������� Ȥ��, �ٽ� ����������� �̵��ϴ� url�ּҸ� ��ȯ
	 * @see QuizRegDAO db�� �ִ� �ӽ� ���� ��� ���̺� �����Ҷ��� �����ö� ���Ǵ� Ŭ����
	 * */		
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp)throws ServletException, IOException {
		QuizRegDAO dao = new QuizRegDAO();
		int i = dao.RegiQuiz(dao.setQuiz(request));
		request.setAttribute("cmd", "INSERT");
		if(i>0){
			return "WEB-INF/views/QuizRegi/RegiComplete.jsp";
		}
		return "WEB-INF/views/QuizRegi/QuizReg.jsp";
	}
	
}
