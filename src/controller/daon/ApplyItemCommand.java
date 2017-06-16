package controller.daon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.ShopManager;
import dto.Shop;

public class ApplyItemCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String code=req.getParameter("code");
		String id=req.getParameter("id");
		
		
		Shop dto = new Shop();
		
		
		ShopManager sDao = ShopManager.getInstance();
		
		
		
		return "/daon_v1/outline/shop.jsp";
	}

}
