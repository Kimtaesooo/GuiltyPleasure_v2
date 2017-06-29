package command.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.loginmodule.Resistration;
import dto.UserInfo;

public class LogResistCommand implements Command {
	private List<UserInfo> userinfo;
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		Resistration dao = new Resistration();		
		UserInfo dto = new UserInfo();				
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		dto.setU_id(request.getParameter("u_id"));
		dto.setU_pw(request.getParameter("u_pw"));
		dto.setU_name(request.getParameter("u_name"));
		dto.setU_nickname(request.getParameter("u_nickname"));
		dto.setU_phone(request.getParameter("u_phone"));
		dto.setU_email(request.getParameter("u_email"));
		dto.setU_addr(request.getParameter("u_addr"));
		dto.setU_postnumber(request.getParameter("u_postnumber"));
		dto.setU_birth(request.getParameter("u_birth"));
		dto.setU_gender(request.getParameter("u_gender"));
		dto.setU_introduce(request.getParameter("u_introduce"));
		dto.setU_question(request.getParameter("u_question"));
		dto.setU_answer(request.getParameter("u_answer"));
		
		dao.regUser(dto);
		
		return "/CORDING/login/login_reg.jsp";
	}

}
