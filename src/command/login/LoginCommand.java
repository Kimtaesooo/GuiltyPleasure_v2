package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.MyInfoDAO;
import dao.loginmodule.Login;
import dao.UserInfoDAO;
import dto.UserInfo;
import dto.UserInfoDTO;

// ·Î±×ÀÎ
public class LoginCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login dao = new Login();		
		UserInfo dto = new UserInfo();
		UserInfoDAO userdao = new UserInfoDAO();
		UserInfoDTO userdto = new UserInfoDTO();
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		String u_id = request.getParameter("form-username");
		String u_pw = request.getParameter("form-password");
		String message = "";
		
		dto = dao.getUser(u_id);
		userdto = userdao.searchUserInfo(u_id);
		
		if(u_pw.equals(dto.getU_pw())){
			if(userdto.getNo_entry() != null || dto.getU_delete().equals("Y")){
				// response.sendRedirect("login_ban.html");
				return "/GuiltyPleasure/CORDING/login/login_ban.html";
			}
			if(dto.getU_power() == 5000){
				session.setAttribute("u_id", "master");			
				//response.sendRedirect("/GuiltyPleasure/main.jsp");
				return "/main.jsp";
			}
			session.setAttribute("u_id", u_id);
			session.setAttribute("u_nickname", dto.getU_nickname());
			//response.sendRedirect("/GuiltyPleasure/main.jsp");
			return "/main.jsp";
		}
		else{
			//response.sendRedirect("login_err.html");
			return "/GuiltyPleasure/CORDING/login/login_err.html";
		}
		
	}
	
}
