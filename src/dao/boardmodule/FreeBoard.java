package dao.boardmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Board;
import dto.Reply;

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
	
	private static FreeBoard instance = new FreeBoard();
	
	public static FreeBoard getInstance(){
		return instance;
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
			// 조회수 증가
			if(isRead){
				sql = "update board set b_count = b_count+1 where b_num = '" + b_num + "'";
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
			}
	
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
	         
	         // 이전 글, 다음 글..
	         sql = "select b_num as prevnum, b_title as prevtitle from board where b_num = (select max(b_num) from board where b_num<?)";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, b_num);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 board.setPrevnum(rs.getString("prevnum"));
	         	board.setPrevtitle(rs.getString("prevtitle"));
	         }
	         sql = "select b_num as nextnum, b_title as nexttitle from board where b_num = (select min(b_num) from board where b_num>?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, b_num);
	         rs = pstmt.executeQuery();
	         if(rs.next()){
	        	 board.setNextnum(rs.getString("nextnum"));
	        	 board.setNexttitle(rs.getString("nexttitle"));
	         }
	         
	        
		}
		catch(Exception err){
            System.out.println("getBoard():read"+err);
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
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_num());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updateBoard()에서 오류");
	        err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	// 댓글 list 뿌리기
	public ArrayList<Reply> getReplyList(String b_num){
		ArrayList<Reply> rep_list = new ArrayList<Reply>();
		String sql = "select * from reply where b_num= ? order by r_reply";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Reply reply = new Reply();
				reply.setR_reply(rs.getString("r_reply"));
				reply.setB_num(rs.getString("b_num"));
				reply.setU_id(rs.getString("u_id"));
				reply.setR_content(rs.getString("r_content"));
				reply.setR_regdate(rs.getString("r_regdate"));
				
				rep_list.add(reply);
			}
		}
		catch(Exception err){
			System.out.println("getReplyList()에서 오류");
			err.printStackTrace();
		}
		finally{
			 pool.freeConnection(con, pstmt, rs);
		}
		return rep_list;
	}
	
	// 댓글 입력
	public void replyBoard(Reply reply){
		String sql = "insert into reply(r_reply, b_num, u_id, r_content, r_regdate) "
				+ "values('R'||LPAD((seq_r_reply.NEXTVAL),4,'0'),?,?,?,sysdate)";
		try{
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, reply.getB_num());
			pstmt.setString(2, reply.getU_id());
			pstmt.setString(3, reply.getR_content());
			pstmt.executeUpdate();
		}
		catch(Exception err){
		      System.out.println("replyBoard()에서 오류 : " + err);
		      err.printStackTrace();
		   }
		   finally{
		      pool.freeConnection(con, pstmt);
		   }
	}
	
	// 댓글 삭제
	public void deleteReply(String r_reply){
		String sql = "delete from reply where r_reply= ? ";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_reply);
	        pstmt.executeUpdate();
		}
		catch(Exception err){
	       System.out.println("deleteReply()에서 오류");
	       err.printStackTrace();
	    }
	    finally{
	       pool.freeConnection(con,pstmt);
	   }
	}
}
