package command.userInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.UserInfoDAO;

public class DeleteRestrictionCommand implements Command{
	UserInfoDAO dao = new UserInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");
		String id = request.getParameter("id");
		int result = dao.deleteRestriction(param, id);
				
		if(result == 1){
			return "WEB-INF/userInfo/userList.jsp";
		}
		return "WEB-INF/userInfo/userInfo.jsp";
	}

}
