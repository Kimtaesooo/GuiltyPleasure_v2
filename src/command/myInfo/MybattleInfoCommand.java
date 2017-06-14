package command.myInfo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyInfoDAO;
import dto.MyInfoDTO;
import controller.Command;

public class MybattleInfoCommand implements Command{
	MyInfoDAO dao = new MyInfoDAO();
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getSession().getAttribute("id").toString();
		MyInfoDTO dto = dao.searchMyBattleInfo(id);
		ArrayList<MyInfoDTO> poaList = dao.searchMyBattlePoaInfo(id);
		ArrayList<MyInfoDTO> regQList = dao.searchReqQInfo(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("poalist", poaList);
		request.setAttribute("regqlist", regQList);
		
		return "WEB-INF/myInfo/myBattleInfo.jsp";
	}

}
