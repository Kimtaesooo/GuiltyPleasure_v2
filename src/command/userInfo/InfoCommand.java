package command.userInfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserInfoDAO;
import dto.ItemDTO;
import dto.UserInfoDTO;
import controller.Command;

public class InfoCommand implements Command {
	UserInfoDAO dao = new UserInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userid");
		String pageno = request.getParameter("pageno")==null?"1":request.getParameter("pageno");
		
		if("".equals(pageno)){
			pageno = "1";
		}

		
		UserInfoDTO dto  = dao.searchUserInfo(id);

		ArrayList<ItemDTO> list = dao.searchUserItemInfo(id, 5, Integer.parseInt(pageno));
		int count  = dao.searchUserItemInfoCount(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("itemList", list);
		request.setAttribute("itemtotal", count);
		request.setAttribute("pageno", pageno);
		
		return "/WEB-INF/views/userInfo/userInfo.jsp";
	}

}
