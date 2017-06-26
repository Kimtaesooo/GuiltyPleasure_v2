package command.userInfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserInfoDAO;
import dto.UserInfoDTO;
import controller.Command;

public class ListCommand implements Command{
	UserInfoDAO dao = new UserInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchInfo = request.getParameter("id")==null?"":request.getParameter("id");
		String order = request.getParameter("order")==null?"UM.U_ID":request.getParameter("order");
		String pageno = request.getParameter("pageno")==null?"1":request.getParameter("pageno");
		
		if("".equals(pageno)){
			pageno = "1";
		}
		
		if("".equals(order)){
			order = "UM.U_ID";
		}
		
		String orderType = request.getParameter("ordertype")==null?"asc":request.getParameter("ordertype");
		
		if("desc".equals(orderType)){
			order += " DESC";
		}
		
		ArrayList<UserInfoDTO> list = dao.searchList(searchInfo, order, 10,Integer.parseInt(pageno));
		
		int count = dao.searchListCount(searchInfo);
		
		request.setAttribute("searchInfo", searchInfo);
		request.setAttribute("ordertype", orderType);
		request.setAttribute("list", list);
		request.setAttribute("total", count);
		request.setAttribute("pageno", pageno);
		
		return "WEB-INF/userInfo/userList.jsp";
	}

}
