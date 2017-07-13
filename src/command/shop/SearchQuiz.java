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


@WebServlet(urlPatterns="/searchQuiz")
public class SearchQuiz extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("utf-8");
		
		String id=req.getParameter("id");
		
		BonusManager bDao = BonusManager.getInstance();
		bDao.searchQuiz(id);
		
		resp.sendRedirect("/GuiltyPleasure/CORDING/shop/outline/searchResult.jsp");
	}
}
