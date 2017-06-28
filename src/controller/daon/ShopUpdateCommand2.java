package controller.daon;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.ShopManager;
import dto.Shop;


@WebServlet(urlPatterns="/shopUpdate")
public class ShopUpdateCommand2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("euc-kr");
		String code=req.getParameter("code");
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		int deadline=Integer.parseInt(req.getParameter("deadline"));
		int limit=Integer.parseInt(req.getParameter("limit"));
		String content=req.getParameter("content");
		
		Shop dto = new Shop();
		dto.setS_itemcode(code);
		dto.setS_itemname(name);
		dto.setS_price(price);
		dto.setS_deadline(deadline);
		dto.setS_limit_num(limit);
		dto.setS_content(content);
		
		ShopManager sDao = ShopManager.getInstance();
		sDao.updateItem(dto);
		resp.sendRedirect("/GuiltyPleasure/CORDING/shop/outline/shop.jsp?cmd=SHOPLIST");
	}
}
