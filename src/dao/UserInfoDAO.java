package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dto.ItemDTO;
import dto.UserInfoDTO;
import dbcp.DBConnectionMgr;

public class UserInfoDAO {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	
	public UserInfoDAO(){
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
		try {
			conn = pool.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<UserInfoDTO> searchList(String id, String order, int pagesize, int no){
		ArrayList<UserInfoDTO> list = new ArrayList<UserInfoDTO>();

		boolean info = false;
		
		String sql = "SELECT * FROM ( SELECT A.U_ID , TO_CHAR(UM.UM_CHAT,'YYYY/MM/DD') AS UM_CHAT ,TO_CHAR(UM.UM_ENROLL,'YYYY/MM/DD') AS UM_ENROLL "
					+ ", TO_CHAR(UM.UM_SINGLE,'YYYY/MM/DD') AS UM_SINGLE , TO_CHAR(UM.UM_BATTLE,'YYYY/MM/DD') AS UM_BATTLE "
					+" , TO_CHAR(UM.UM_ENTRY,'YYYY/MM/DD') AS UM_ENTRY "
					+ ", DECODE(A.U_DELETE,'Y','Ε»Επ'"
							+ "           ,'W','΄λ±β','') AS U_DELETE "					
					+", ROW_NUMBER() OVER (ORDER BY "+order+") AS NUM "
					+" FROM USERINFO A "
					+" INNER JOIN U_MANAGE UM "
					+" ON A.U_ID = UM.U_ID";
		
		if(!id.isEmpty()){
			sql += " WHERE A.U_ID LIKE '%'||?||'%'";
			info = true;
		}
		sql += " ) WHERE NUM BETWEEN "+(pagesize*(no-1)+1)+" AND "+pagesize*no;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(info){
				pstmt.setString(1, id);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				UserInfoDTO dto = new UserInfoDTO();
				dto.setId(rs.getString("u_id"));
				dto.setNo_chat(rs.getString("um_chat"));
				dto.setNo_enroll(rs.getString("um_enroll"));
				dto.setNo_single(rs.getString("um_single"));
				dto.setNo_battle(rs.getString("um_battle"));
				dto.setNo_entry(rs.getString("um_entry"));
				dto.setDelete(rs.getString("u_delete"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public int searchListCount(String id){
		int count = 0;
		boolean info = false;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM U_MANAGE";
		
		if(!id.isEmpty()){
			sql += " WHERE U_ID LIKE '%'||?||'%'";
			info = true;
		}		
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(info){
				pstmt.setString(1, id);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("count");				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return count;
	}
	
	public UserInfoDTO searchUserInfo(String id){
		UserInfoDTO dto = new UserInfoDTO();
		String sql = "SELECT USR.U_ID "
				+ ", USR.U_COMMENT "
				+ ", USR.U_DELETE "
				+ ", TO_CHAR(CASE WHEN UM.UM_CHAT > CURRENT_TIMESTAMP THEN UM_CHAT ELSE NULL END,'YYYY-MM-DD') AS UM_CHAT "
				+", TO_CHAR(CASE WHEN UM.UM_SINGLE > CURRENT_TIMESTAMP THEN UM_SINGLE ELSE NULL END,'YYYY-MM-DD') AS UM_SINGLE "
				+", TO_CHAR(CASE WHEN UM.UM_BATTLE > CURRENT_TIMESTAMP THEN UM_BATTLE ELSE NULL END,'YYYY-MM-DD') AS UM_BATTLE "
				+", TO_CHAR(CASE WHEN UM.UM_ENROLL > CURRENT_TIMESTAMP THEN UM_ENROLL ELSE NULL END,'YYYY-MM-DD') AS UM_ENROLL "
				+", TO_CHAR(CASE WHEN UM.UM_ENTRY > CURRENT_TIMESTAMP THEN UM_ENTRY ELSE NULL END,'YYYY-MM-DD') AS UM_ENTRY "
				+" FROM USERINFO USR "
				+" INNER JOIN U_MANAGE UM "
	            +" ON USR.U_ID = UM.U_ID "
	            +" WHERE USR.U_ID = ?";
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setId(rs.getString("u_id"));
				dto.setIntroduce(rs.getString("u_comment"));
				dto.setNo_chat(rs.getString("um_chat"));
				dto.setNo_single(rs.getString("um_single"));
				dto.setNo_battle(rs.getString("um_battle"));
				dto.setNo_enroll(rs.getString("um_enroll"));
				dto.setNo_entry(rs.getString("um_entry"));
				System.out.println("rs = "+rs.getString("um_entry"));
				dto.setIntroduce(rs.getString("u_comment"));
				dto.setDelete(rs.getString("u_delete"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	public ArrayList<ItemDTO> searchUserItemInfo(String id, int pagesize, int no){
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		System.out.println("pagesize = "+pagesize);
		String sql = "SELECT * FROM (SELECT P_ITEM_NAME , NVL2(P_BUY_DATE,TO_CHAR(P_BUY_DATE,'YYYY-MM-DD'),'') AS P_BUY_DATE "
				+ ", NVL2(P_ITEM_LIMIT,TO_CHAR(P_ITEM_LIMIT,'YYYY-MM-DD'),'') AS P_ITEM_LIMIT "
				+ ", P_PRICE , ROW_NUMBER() OVER (ORDER BY P_BUY_DATE) AS NUM FROM PURCHASE A WHERE A.U_ID = ?) "
				+ " WHERE NUM BETWEEN "+(pagesize*(no-1)+1)+" AND "+pagesize*no;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ItemDTO dto = new ItemDTO();
				dto.setItem_name(rs.getString("p_item_name"));
				dto.setBuy_date(rs.getString("p_buy_date"));
				dto.setItem_limit(rs.getString("p_item_limit"));
				dto.setPrice(rs.getInt("p_price"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public int searchUserItemInfoCount(String id){
		int count = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM PURCHASE WHERE U_ID = ?";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("count");				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}
		
		return count;
	}
	
	public int updateRestiction(String param, String id){
		int result = -1;
		int cnt = 1;
		int insert = 1;
		boolean chat = false;
		boolean enroll = false;
		boolean single = false;
		boolean battle = false;
		boolean entry = false;

		String sql = "UPDATE U_MANAGE SET";
		HashMap<String, String> map = new HashMap<String, String>();
		
		String info[] = param.trim().split(" ");
		
		for(int i=0;i<info.length;i++){
			map.put(info[i].split("=")[0], info[i].split("=")[1]);
		}
		
		if(map.get("um_chat") != null){
			if(cnt == 1){
				sql += " UM_CHAT = ?";
			}else{
				sql += " , UM_CHAT = ?";
			}
			chat = true;
			cnt++;
		}
		
		if(map.get("um_enroll") != null){
			if(cnt == 1){
				sql += " UM_ENROLL = ?";
			}else{
				sql += " , UM_ENROLL = ?";
			}
			enroll = true;
			cnt++;
		}
		
		if(map.get("um_single") != null){
			if(cnt == 1){
				sql += " UM_SINGLE = ?";
			}else{
				sql += " , UM_SINGLE = ?";
			}
			single = true;
			cnt++;
		}
		
		if(map.get("um_battle") != null){
			if(cnt == 1){
				sql += " UM_BATTLE = ?";
			}else{
				sql += " , UM_BATTLE = ?";
			}
			battle = true;
			cnt++;
		}
		
		if(map.get("um_entry") != null){
			if(cnt == 1){
				sql += " UM_ENTRY = ?";
			}else{
				sql += " , UM_ENTRY = ?";
			}
			entry = true;
			cnt++;
		}
		sql += " WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(chat){
				pstmt.setString(insert, map.get("um_chat"));
				insert++;
			}
			
			if(enroll){
				pstmt.setString(insert, map.get("um_enroll"));
				insert++;
			}
			
			if(single){
				pstmt.setString(insert, map.get("um_single"));				
				insert++;
			}
			
			if(battle){
				pstmt.setString(insert, map.get("um_battle"));
				insert++;
			}
			if(entry){
				pstmt.setString(insert, map.get("um_entry"));
				insert++;
			}
			
			pstmt.setString(insert, id);			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int quitUser(String id){
		int result = -1;
		String sql = "UPDATE USERINFO SET U_DELETE = 'Y' WHERE U_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int deleteRestriction(String param, String id) {
		int result = -1;
		int delResult = -1;
		int cnt = 1;
		int insert = 1;
		
		boolean chat = false;
		boolean enroll = false;
		boolean single = false;
		boolean battle = false;
		boolean entry = false;
		
		String sql = "UPDATE U_MANAGE SET ";
		String sqlDelete = "UPDATE USERINFO SET U_DELETE = 'N' WHERE U_ID = ?";
		if(param.contains("chat")){
			if(cnt == 1){
				sql += "UM_CHAT = ? ";
			}else{
				sql += ", UM_CHAT = ? ";
			}
			cnt++;
			chat = true;
		}
		if(param.contains("enroll")){
			if(cnt == 1){
				sql += "UM_ENROLL = ? ";
			}else{
				sql += ", UM_ENROLL = ? ";
			}
			cnt++;
			enroll = true;
		}
		if(param.contains("single")){
			if(cnt == 1){
				sql += "UM_SINGLE = ? ";
			}else{
				sql += ", UM_SINGLE = ? ";
			}
			single = true;
		}
		if(param.contains("battle")){
			if(cnt == 1){
				sql += "UM_BATTLE = ? ";
			}else{
				sql += ", UM_BATTLE = ? ";
			}
			cnt++;
			battle = true;
		}
		if(param.contains("entry")){
			if(cnt == 1){
				sql += "UM_ENTRY = ? ";
			}else{
				sql += ", UM_ENTRY = ? ";
			}
			cnt++;
			entry = true;
		}
		sql += " WHERE U_ID = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(chat){
				pstmt.setString(insert, "");
				insert++;
			}
			if(enroll){
				pstmt.setString(insert, "");
				insert++;
			}
			if(single){
				pstmt.setString(insert, "");
				insert++;
			}
			if(battle){
				pstmt.setString(insert, "");
				insert++;
			}
			if(entry){
				pstmt.setString(insert, "");
				insert++;
			}
			
			pstmt.setString(insert, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(param.contains("del")){
			try {
				pstmt = conn.prepareStatement(sqlDelete);
				pstmt.setString(1, id);
				delResult = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(delResult == 1 && result == 1){
			return 1;
		}
		return delResult==1?result:delResult;
	}
}

