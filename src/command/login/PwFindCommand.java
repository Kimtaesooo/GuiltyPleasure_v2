package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.loginmodule.idpw;

public class PwFindCommand implements Command{
	// 비밀번호 찾기
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		idpw search = new idpw();
		String rightPw = "success";
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String select = request.getParameter("select");
		String answer = request.getParameter("answer");
		String pw = search.searchPw(id, email, select, answer);
		
		if(pw.length()==0){
			request.setAttribute("rightPw", "failed");
			request.setAttribute("pw", "잘못 입력하셨거나 없는 정보입니다..");
		}
		else{
			request.setAttribute("rightPw", rightPw);
			request.setAttribute("pw", pw);
		}
		
		return "/CORDING/login/pw_proc.jsp";
	}

}
