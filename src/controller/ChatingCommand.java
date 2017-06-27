package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.DBConnectionMgr;
import dao.playmodule.ChatingDB;
import dto.Battle_Chating;

public class ChatingCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String state = req.getParameter("state");
		System.out.println(state);
		JSONArray arry = null;
		ChatingDB cdb = new ChatingDB();
		if("GET".equals(state)){
			arry = (JSONArray) cdb.getMessage();
		}
		JSONObject json = new JSONObject();
		json.put("chating", arry);
		return json;
	}

}
