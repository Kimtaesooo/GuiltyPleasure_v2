package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;


/**
 * �̱۰��ӿ��� �����ư�� ������ ������ ����� ���Ӱ���� �����ϰ� �̵��� �������� �����ִ� Ŭ����
 * @author ������
 * */
public class GiveupCommand implements Command{

	
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @return String ������ �����ϰ� ������������ �ּҸ� ��ȯ
	 * 
	 * @see session ���ӿ��� ��ϵ� ����� �������ִ� session
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
