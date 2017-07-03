package command.myInfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyInfoDAO;
import dao.UserInfoDAO;
import dto.ItemDTO;
import dto.MyInfoDTO;
import controller.Command;

public class MybattleInfoCommand implements Command{
	MyInfoDAO dao = new MyInfoDAO();
	UserInfoDAO uDao = new UserInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getSession().getAttribute("u_id").toString();
		String pageno = request.getParameter("pageno")==null?"1":request.getParameter("pageno");
		
		MyInfoDTO dto = dao.searchMyBattleInfo(id);
		ArrayList<MyInfoDTO> poaList = dao.searchMyBattlePoaInfo(id);
		ArrayList<MyInfoDTO> regQList = dao.searchReqQInfo(id);
		
		if("".equals(pageno)){
			pageno = "1";
		}		
		
		ArrayList<ItemDTO> list = uDao.searchUserItemInfo(id, 5, Integer.parseInt(pageno));
		int count  = uDao.searchUserItemInfoCount(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("poalist", poaList);
		request.setAttribute("regqlist", regQList);
		
		request.setAttribute("itemList", list);
		request.setAttribute("itemtotal", count);
		request.setAttribute("pageno", pageno);
		
		
		return "WEB-INF/myInfo/myBattleInfo.jsp";
	}
}
