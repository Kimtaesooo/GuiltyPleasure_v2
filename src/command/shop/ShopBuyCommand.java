package command.shop;

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


@WebServlet(urlPatterns="/shopBuy")
public class ShopBuyCommand extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("utf-8");
		ShopManager sDao = ShopManager.getInstance();
		String code=req.getParameter("code");
		String id=req.getParameter("id");
		
		int userPoint=Integer.parseInt(req.getParameter("userPoint"));
		Shop dto=sDao.selectOneItemByCode(code); //������ �ڵ尪���� ������ dto����
		sDao.minusOneItem(code, dto.getS_limit_num()); //������ ���� �ϳ� ����
		sDao.setUserPoint(id, userPoint); //���� ����Ʈ ����
		sDao.addPurchaseList(id,dto); //���Ÿ���Ʈ���߰�
		sDao.addItemFunction(id, dto); //������ ��� �߰�
		
		String nickname=req.getParameter("nickname");
		if(nickname!=null){
		sDao.editNickname(id, nickname);
		}
		resp.sendRedirect("/WEB-INF/views/shop/outline/shop.jsp?cmd=SHOPLIST");
	}
}
