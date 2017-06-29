package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.loginmodule.idpw;

public class IdFindCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		idpw search = new idpw();
		String rightId = "";
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = search.searchId(name, email);

		if(id.length()==0){
			rightId = "failed";
			id = "잘못 입력하셨거나 없는 정보입니다..";
			request.setAttribute("id", id);
			request.setAttribute("rightId", rightId);
		}
		else{
			rightId = "success";
			request.setAttribute("id", id);
			request.setAttribute("rightId", rightId);
			request.setAttribute("email", email);
		}
		
		return "/CORDING/login/id_proc.jsp";
	}

}
