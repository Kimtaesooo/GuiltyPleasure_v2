package controller.daon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.ShopManager;
import dto.Shop;

public class ShopBuyCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ShopManager sDao = ShopManager.getInstance();
		String code=req.getParameter("code");
		Shop dto=sDao.selectOneItemByCode(code);
		System.out.println(code);
		req.setAttribute("item",dto);
		
		return "/daon_v1/outline/shop.jsp";
	}

}
