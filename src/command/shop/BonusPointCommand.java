package command.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.BonusManager;
import dao.shopmodule.ShopManager;
import dto.Shop;


@WebServlet(urlPatterns="/bonusPoint")
public class BonusPointCommand extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("utf-8");
		BonusManager bDao = BonusManager.getInstance();
		
		String id=req.getParameter("id");
		
		bDao.bonusPoint(id);
		resp.sendRedirect("/WEB-INF/views/shop/outline/shop.jsp?cmd=SHOPLIST");
	}
}
