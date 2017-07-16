package dao.noticemodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Notice;

/**
 * 공지사항에 사용된 클래스입니다.
 */
public class notice {
	/**
	 * @param String sql 쿼리문을 저장시킬 변수입니다.
	 */
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	//쿼리문 쓰일 변수
	private String sql = "";
	
	public notice(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : "+err);
		}
	}
	//유저 닉네임 가져오는 메서드
	public String getUserNick (String u_id){
		/**
		 * 닉네임 반환 메서드 입니다.
		 * @param String nickname 닉네임 저장 변수입니다.
		 * @return String nickname 사용자의 닉네임을 반환합니다.
		 */
		String nickname=null;
		sql = "select * from userinfo where U_ID='"+u_id+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				nickname = rs.getString("u_nickname");
			}
		}
		catch(Exception err){
			System.out.println("getUserNickn() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return nickname;
	}
	//글 등록
	public void regN_board(Notice dto){
		/**
		 * 글 등록 메서드 입니다.
		 */
		sql = "INSERT INTO NOTICE (N_NUM, U_ID, U_NICKNAME, N_TITLE, N_CONTENT, N_REGDATE, N_COUNT, N_IMPORTANT)"+
		" VALUES (seq_n_num.NEXTVAL,"+
		" ?,?,?,?,sysdate,'0','0')";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getU_id());
			//작성자는 무조건 운영자
			pstmt.setString(2, "운영자");
			pstmt.setString(3, dto.getN_title());
			pstmt.setString(4, dto.getN_content());
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("regN_boadr() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//게시판 뿌려주기
	public List getBoardList(String id, String type, String key){
		/**
		 * 게시판 목록을 가져오는 메소드입니다.
		 * @return List list 게시판 목록을 반환합니다.
		 */
		ArrayList list = new ArrayList();
		
		if (key.length() == 0 || key == null) {
			sql = "select * from notice order by n_regdate desc";
		} else {
			sql = "select * from notice where "+type+" like '%" + key
					+ "%' order by n_regdate desc";
		}
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				Notice dto = new Notice();
				dto.setN_num(rs.getString("n_num"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_regdate(rs.getString("n_regdate"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_nickname(rs.getString("u_nickname"));
				dto.setN_count(rs.getInt("n_count"));
				list.add(dto);
				}
		}
		catch(Exception err){
			System.out.println("noticeList 가져오기 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return list;
	}
	//글읽기
	public Notice getRead (String num){
		/**
		 * 글 읽기 메소드 입니다.
		 * @return Notice dto 공지사항 dto 를 반환합니다.
		 */
		Notice dto = new Notice();
		
		sql = "select * from notice where n_num='"+num+"'";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_regdate(rs.getString("n_regdate"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_nickname(rs.getString("u_nickname"));
				dto.setN_count(rs.getInt("n_count"));
				}
		}
		catch(Exception err){
			System.out.println("getRead() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return dto;
	}
	
	//조회수증가
	public void N_Count_Update(String num){
		/**
		 * 조회수 증가 메서드입니다.
		 */
		sql = "UPDATE NOTICE SET N_COUNT=N_COUNT+1 WHERE N_NUM='"+num+"'";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("N_Count_Update() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//유저 비밀번호 가져오기
	public String getUserPw (String u_id){
		/**
		 * 유저 비밀번호 가져오기 메소드입니다.
		 * @param String as 비밀번호 저장에 사용될 변수 입니다.
		 * @return String as 비밀번호를 반환합니다.
		 */
		String as=null;
		sql = "select * from userinfo where U_ID='"+u_id+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				as = rs.getString("u_pw");
				}
		}
		catch(Exception err){
			System.out.println("getUserPw() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return as;
	}
	
	//글 지우기
	public void deleteBoard(String n_num){
		/**
		 * 글 지우기 메소드입니다.
		 */
		String sql = "delete from NOTICE where n_num=?";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n_num);
			pstmt.executeUpdate();
		}
		catch(Exception err){
	       System.out.println("deleteBoard()에서 오류");
	       err.printStackTrace();
	    }
	    finally{
	      pool.freeConnection(con,pstmt);
	    }
	}
}
