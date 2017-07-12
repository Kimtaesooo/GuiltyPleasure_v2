package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.UserInfoDAO;
import dao.loginmodule.Login;
import dto.UserInfo;
import dto.UserInfoDTO;

// �α���
public class LoginPageCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/WEB-INF/views/login/login.jsp";
	}
	
}
