package command.myInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyInfoDAO;
import dto.MyInfoDTO;
import controller.Command;

public class MyinfoCommand implements Command{
	MyInfoDAO dao = new MyInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getSession().getAttribute("u_id").toString();
		MyInfoDTO dto = dao.searchMyInfo(id);
		
		request.setAttribute("dto", dto);
		return "WEB-INF/myInfo/myInfo.jsp";
	}

}
