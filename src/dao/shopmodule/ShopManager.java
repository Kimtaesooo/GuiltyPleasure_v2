package dao.shopmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Shop;

public class ShopManager {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public ShopManager(){
		try{
			pool=DBConnectionMgr.getInstance();
			
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패:"+err);
		}
		finally{
			
		}
	}
	
	private static ShopManager instance = new ShopManager();
	
	public static ShopManager getInstance(){
		return instance;
	}
	
	//아이템 수정
	public void updateItem(Shop dto) {
		try {
			String sql = "update shop set s_itemname=?,s_price=?, s_deadline=?,s_limit_num=?,s_limit_pow=?,s_content=? where s_itemcode=?";

			con = pool.getConnection();

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getS_itemname());
			pstmt.setInt(2, dto.getS_price());
			pstmt.setInt(3, dto.getS_deadline());
			pstmt.setInt(4, dto.getS_limit_num());
			pstmt.setInt(5, dto.getS_limit_pow());
			pstmt.setString(6, dto.getS_content());
			pstmt.setString(7, dto.getS_itemcode());
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("updateItem()에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	//아이템 추가
//	public void addItem(Board board){
//		try{
//			
//			con = pool.getConnection();
//			String sql="Insert into tblBoard (b_num,b_name,b_email,b_homepage,b_subject,b_content,b_regdate,b_pass,b_ip,b_count,b_pos,b_depth) values(seq_bnum.nextVal, ?,?,?,?,?,sysdate,?,?,0,0,0)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, board.getB_name());
//			pstmt.setString(2, board.getB_email());
//			pstmt.setString(3, board.getB_homepage());
//			pstmt.setString(4, board.getB_subject());
//			pstmt.setString(5, board.getB_content());
//			pstmt.setString(6, board.getB_pass());
//			pstmt.setString(7, board.getB_ip());
//			pstmt.executeUpdate();
//
//		}
//		catch(Exception err){
//			System.out.println("addItem():"+err);
//			err.printStackTrace();
//		}
//		finally{
//			pool.freeConnection(con,pstmt);
//		}
//	}
//	
//	public void deleteItem(int b_num) {
//		try {
//			String sql = "delete from tblBoard where b_num="+b_num;
//
//			con = pool.getConnection();
//			pstmt = con.prepareStatement(sql);
//			pstmt.executeUpdate();
//
//		} catch (Exception err) {
//			System.out.println("updateBoard()에서 오류");
//			err.printStackTrace();
//		} finally {
//			pool.freeConnection(con, pstmt, rs);
//		}
//	}
	public Shop selectOneItemByCode(String s_itemcode){
		String sql = "select * from shop WHERE s_itemcode=?";
		Shop dto=null;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_itemcode);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto=new Shop();
				dto.setS_itemcode(rs.getString("s_itemcode"));
				dto.setS_itemname(rs.getString("s_itemname"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_deadline(rs.getInt("s_deadline"));
				dto.setS_limit_num(rs.getInt("s_limit_num"));
				dto.setS_limit_pow(rs.getInt("s_limit_pow"));
				dto.setS_content(rs.getString("s_content"));
			}
		}
		catch(Exception err){
			System.out.println("getItemList()에서오류");
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}
	
	public List getItemList() {
		ArrayList list = new ArrayList();
		String sql = "select * from shop";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				Shop dto=new Shop();
				dto.setS_itemcode(rs.getString("s_itemcode"));
				dto.setS_itemname(rs.getString("s_itemname"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_deadline(rs.getInt("s_deadline"));
				dto.setS_limit_num(rs.getInt("s_limit_num"));
				dto.setS_limit_pow(rs.getInt("s_limit_pow"));
				dto.setS_content(rs.getString("s_content"));
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getItemList()에서오류");
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
}
