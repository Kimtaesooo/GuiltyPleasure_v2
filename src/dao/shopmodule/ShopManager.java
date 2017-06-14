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
			String sql = "update shop set s_itemname=?,s_price=?, s_deadline=?,s_limit_num=?,s_content=? where s_itemcode=?";

			con = pool.getConnection();

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getS_itemname());
			pstmt.setInt(2, dto.getS_price());
			pstmt.setInt(3, dto.getS_deadline());
			pstmt.setInt(4, dto.getS_limit_num());
			pstmt.setString(5, dto.getS_content());
			pstmt.setString(6, dto.getS_itemcode());
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("updateItem()에서 오류");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//아이템 추가
	public void addItem(Shop dto){
		try{
			String sql="Insert into shop (s_itemcode, s_itemname,s_price,s_deadline,s_limit_num,s_limit_pow,s_content) values('SIC'||LPAD((seq_s_itemcode.NEXTVAL),4,'0'),?,?,?,?,'',?)";
			

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getS_itemname());
			pstmt.setInt(2, dto.getS_price());
			pstmt.setInt(3, dto.getS_deadline());
			pstmt.setInt(4, dto.getS_limit_num());
			pstmt.setString(5, dto.getS_content());
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("addItem():"+err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt);
		}
	}

	//아이템선택
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
	
	//아이템 삭제
	public void deleteItemByCode(String s_itemcode){
		String sql = "delete shop WHERE s_itemcode=?";
		Shop dto=null;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_itemcode);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("getItemList()에서오류");
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
	}
	
	//전체리스트출력
	public List getItemList() {
		ArrayList list = new ArrayList();
		String sql = "select * from shop order by s_itemcode";
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
