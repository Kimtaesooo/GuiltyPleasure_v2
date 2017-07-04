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


@WebServlet(urlPatterns="/applyItem")
public class ApplyItemCommand extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("euc-kr");
		String code=req.getParameter("code");
		String id=req.getParameter("id");
		
		
		Shop dto = new Shop();
		
		
		ShopManager sDao = ShopManager.getInstance();
		
		resp.sendRedirect("/GuiltyPleasure/CORDING/shop/outline/shop.jsp?cmd=SHOPLIST");
	}
}
