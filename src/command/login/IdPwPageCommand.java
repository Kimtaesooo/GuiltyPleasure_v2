package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.loginmodule.idpw;


//로그아웃
public class IdPwPageCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		idpw dao = new idpw();
		
		String [] u_find = dao.getBoardList();
		session.setAttribute("u_find", u_find);
		
		return "/WEB-INF/views/login/idpw.jsp";		
		
	}
	
}
