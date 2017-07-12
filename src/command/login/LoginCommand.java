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

// 로그인
public class LoginCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		if (u_pw.equals(dto.getU_pw())) {
			if (userdto.getNo_entry() != null || dto.getU_delete().equals("Y")) {
				// response.sendRedirect("login_ban.html");
				return "/CORDING/login/login_ban.jsp";
			}
			if (dto.getU_power() == 5000) {
				session.setAttribute("u_id", "master");
				session.setAttribute("u_pw", dto.getU_pw());
				// response.sendRedirect("/GuiltyPleasure/main.jsp");
				return "/main.jsp";
			}
			session.setAttribute("u_id", u_id);
			session.setAttribute("u_nickname", dto.getU_nickname());
			session.setAttribute("udto", userdto);
			// response.sendRedirect("/GuiltyPleasure/main.jsp");
			return "/main.jsp";
		} else {
			// response.sendRedirect("login_err.html");
			return "/CORDING/login/login_err.jsp";
		}

	}

}
