package command.userInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserInfoDAO;
import controller.Command;

public class QuitCommand implements Command{
	UserInfoDAO dao = new UserInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int result = dao.quitUser(id);
		if(result != 1){
			return "";
		}
		return "WEB-INF/userInfo/userList.jsp";
	}

}
