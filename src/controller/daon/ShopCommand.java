package controller.daon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.ShopManager;

public class ShopCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ShopManager sDao = ShopManager.getInstance();
		List itemList=sDao.getItemList();
		req.setAttribute("itemList",itemList);
		
		return "/daon_v1/shop.jsp";
	}

}
