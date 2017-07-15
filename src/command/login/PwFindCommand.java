package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Command;
import dao.loginmodule.idpw;

public class PwFindCommand implements Command{
	// 비밀번호 찾기
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		idpw search = new idpw();
		String rightPw = "success";
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String select = request.getParameter("select");
		String answer = request.getParameter("answer");
		String pw = search.searchPw(id, email, select, answer);
		
		if(pw.length()==0){
			session.setAttribute("rightPw", "failed");
			session.setAttribute("pw", "잘못 입력하셨거나 없는 정보입니다..");
		}
		else{
			session.setAttribute("rightPw", rightPw);
			session.setAttribute("pw", pw);
		}
		
		return "/WEB-INF/views/login/pw_proc.jsp";
	}

}
