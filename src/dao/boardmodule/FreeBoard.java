package dao.boardmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Board;

public class FreeBoard {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public FreeBoard(){
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : " + err);
		}
	}
	
	//BoardWrite_proc.jsp 글쓰기 기능
	public void regBoard(String u_id, String b_title, String b_content){
		String u_nickname ="";
		String sql = "select u_nickname from userinfo where u_id='"+ u_id + "'";
		
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				u_nickname = rs.getString("u_nickname");				
			}
		}
			catch(Exception err){
			System.out.println("regBoard 첫번째 트라이에서 오류 :"+err);
				err.printStackTrace();
			}
		
		sql = "insert into board(b_num, b_title, u_id, u_nickname, b_content, b_regdate, b_count)"
				+ "values('B'||LPAD((seq_b_num.NEXTVAL),4,'0'),?,?,?,?,sysdate,0)";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_title);
			pstmt.setString(2, u_id);
			pstmt.setString(3, u_nickname);
			pstmt.setString(4, b_content);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("regBoard() 2번째에서 오류 :"+err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt);
		}	
	}

	//BoardList.jsp - 게시판 글 리스트 가져오기
	public List getBoardList(String keyword, String keyfield){
		ArrayList list = new ArrayList();
		String sql = "";
			
		//검색기능
		if(keyword==null || keyword.equals("null") || keyword==""){
			sql = "select * from board order by b_num";
		}
		else{
			sql = "select * from board where " + keyfield + " like '%" + keyword + "%' order by b_num";
		}
			
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				Board board = new Board();
				board.setB_num(rs.getString("b_num"));
				board.setB_title(rs.getString("b_title"));
				board.setU_nickname(rs.getString("u_nickname"));
				board.setB_regdate(rs.getString("b_regdate"));
				board.setB_count(rs.getInt("b_count"));
					
				list.add(board);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList()에서 오류: "+err);
			err.printStackTrace();
		}
		finally{
			if(pool!=null){
				pool.freeConnection(con, pstmt, rs);
			}
		}
		return list;
	}
	
	// BoardList.jsp, Read.jsp, Update.jsp
	public Board getBoard(String b_num, boolean isRead){
		Board board = new Board();
		String sql = null;
		try{
			// 상세 글  조회
			sql = "select * from board where b_num='"+ b_num +"'";
			pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	         
	         if(rs.next()){
	        	 board.setB_num(rs.getString("b_num").replace("\n", "<br>"));
	        	 board.setU_id(rs.getString("u_id"));
	        	 board.setB_count(rs.getInt("b_count"));
	        	 board.setU_nickname(rs.getString("u_nickname"));
	        	 board.setB_regdate(rs.getString("b_regdate"));
	        	 board.setB_title(rs.getString("b_title"));
	        	 board.setB_content(rs.getString("b_content"));
	         }
		}
		catch(Exception err){
            System.out.println("getBoard():read"+err);
            //return null;
         }
         finally{
            pool.freeConnection(con, pstmt, rs);
         }
         return board;
	}
	
	// Delete.jsp
	public void deleteBoard(String b_num){
		String sql = "delete from board where b_num='" + b_num + "'";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			System.out.println("del222");
		}
		catch(Exception err){
	       System.out.println("deleteBoard()에서 오류");
	       err.printStackTrace();
	    }
	    finally{
	      pool.freeConnection(con,pstmt);
	    }
	}
	
	// UpdateProc.jsp
	public void updateBoard(Board board){
		String sql = "update board set b_title=?, b_content=? where b_num=?";
		System.out.println(board.getB_title());
		System.out.println(board.getB_content());
		System.out.println(board.getB_num());
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_num());
			pstmt.executeUpdate();
			System.out.println("수정");
		}
		catch(Exception err){
			System.out.println("updateBoard()에서 오류");
	        err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt);
		}
	}
}
