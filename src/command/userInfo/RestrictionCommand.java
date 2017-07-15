package command.userInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserInfoDAO;
import controller.Command;

public class RestrictionCommand implements Command{
	UserInfoDAO dao = new UserInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("param");

		if(param.isEmpty()){
			return "/WEB-INF/views/userInfo/userList.jsp";
		}
		
		String id = request.getParameter("id")==null?"":request.getParameter("id");
		int result = dao.updateRestiction(param, id);
		
		if(result != 1){
			return "";
		}
		return "/WEB-INF/views/userInfo/userList.jsp";
	}	
}