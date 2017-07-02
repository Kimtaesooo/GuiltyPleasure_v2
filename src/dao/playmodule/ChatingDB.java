package dao.playmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.DBConnectionMgr;
import dto.Battle_Chating;

public class ChatingDB {
	DBConnectionMgr db;
	Connection con;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	public ChatingDB() {
		String sql = "연결이 안되었습니다.";
		try {
			db = DBConnectionMgr.getInstance();
			con = db.getConnection();
			
			sql = "db가 연결되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DB에서 저장된 메세지 가져오기
	//매개변수로 내 아이디와 상대방의 아이디를 받아야한다.
	public ArrayList<Battle_Chating> getMessage(){
		JSONArray array = new JSONArray();
		Battle_Chating bc = null;
		String sql = "select * from CHATING ";
		JSONObject json = new JSONObject();
		try {
			psmt = con.prepareStatement(sql);
			rs  = psmt.executeQuery();
			
			while(rs.next()){
				bc = new Battle_Chating();
				String u_id = rs.getString("U_ID");
				String message = rs.getString("MESSAGE");
				bc.setMessage(message);
				bc.setU_id(u_id);
				array.add(bc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return array;
		
	}
}
