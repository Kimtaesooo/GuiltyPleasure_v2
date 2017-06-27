package dao.playmodule;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.Command;
import controller.CommandFactory;

@WebServlet(urlPatterns="/battle")
public class BattleServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("euc-kr");
		resp.setContentType("application/x-json; charset=UTF-8");
		String cmd = req.getParameter("cmd");
		
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		PrintWriter out = resp.getWriter();
		JSONObject json = new JSONObject();
		json= (JSONObject)command.processCommand(req, resp);
		out.print(json);
	}
	
}
