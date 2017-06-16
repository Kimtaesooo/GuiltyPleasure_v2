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
		String id=req.getParameter("id");
		int userPoint=Integer.parseInt(req.getParameter("userPoint"));
		Shop dto=sDao.selectOneItemByCode(code);
		System.out.println(code+"코드야");
		System.out.println(dto.getS_deadline()+"데드라인이야");
		sDao.minusOneItem(code, dto.getS_limit_num());
		sDao.setUserPoint(id, userPoint);
		sDao.addPurchaseList(id,dto);
		
		return "/daon_v1/outline/shop.jsp";
	}

}
