package command.myInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyInfoDAO;
import controller.Command;

public class DeleteCommand implements Command{
	MyInfoDAO dao = new MyInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getSession().getAttribute("u_id").toString();
		int result = dao.reqDelUser(id);
		
		if(result != 1){
			return "";
		}
		
		return "main.jsp";
	}

}
