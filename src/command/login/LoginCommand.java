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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String u_id = request.getParameter("form-username");
		String u_pw = request.getParameter("form-password");
		String message = "";

		dto = dao.getUser(u_id);
		userdto = userdao.searchUserInfo(u_id);

		if (u_pw.equals(dto.getU_pw())) {
			// 로그인 제제를 당한경우
			if (userdto.getNo_entry() != null || dto.getU_delete().equals("Y")) {
				// response.sendRedirect("login_ban.html");
				return "/WEB-INF/views/login/login_ban.jsp";
			}
			// 접속한 아이디가 운영자인 경우
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
			// 로그인 에러가 일어난 경우(아이디가 없거나, 비밀번호가 틀렸거나)
			//response.sendRedirect("login_err.html");
			return "/WEB-INF/views/login/login_err.jsp";
		}

	}

}
