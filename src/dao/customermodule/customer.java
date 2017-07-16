package dao.customermodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.c_board;
/**
 * 고객센터  클레스입니다.
 */

public class customer {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	private String sql = "";
	
	public customer(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP 인스턴스 참조 실패 : "+err);
		}
	}
	
	//글 등록
	public void regC_board(c_board dto){
		/**
		 * 글 등록 메소드입니다.
		 * @param c_board dto 글 등록 메서드는 매개변수 c_board 를 전달 받는다.
		 */
		sql = "INSERT INTO SERVICE_CENTER (SC_NUM, U_ID, SC_TYPE, SC_TITLE, SC_CONTENT, SC_REGDATE, SC_IMAGE, SC_STATE)"+
		" VALUES ('SC'||LPAD((seq_sc_num.NEXTVAL),4,'0'),"+
		" ?,?,?,?,sysdate,'','대기')";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getU_id());
			pstmt.setString(2, dto.getSc_type());
			pstmt.setString(3, dto.getSc_title());
			pstmt.setString(4, dto.getSc_content());
			
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("regC_boadr() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//글 뿌려주기
	public List getBoardList(String id, String type, String key){
		/**
		 * 글 목록 전달 메소드입니다.
		 * @return List list 리스트를 반환합니다.
		 */
		ArrayList list = new ArrayList();
		//게시글 검색에 조건 안달렸을 때
		if(key.length()==0||key==null){
			//마스터일경우 고객센터 글 전부 가져옴
			if(id.equals("master")){
				sql = "select * from service_center  order by sc_state asc, sc_regdate desc";
			}else{
				sql = "select * from service_center where u_id='"+id+"' order by sc_state asc, sc_regdate desc";}
		}
		else{
			if(id.equals("master")){
				sql = "select * from service_center where "+type+" like '%"+key+"%' order by  sc_state asc, sc_regdate desc";
			}else{
				sql = "select * from service_center where u_id='"+id+"' and "+type+" like '%"+key+"%' order by sc_state asc, sc_regdate desc";}
		}
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				c_board dto = new c_board();
				dto.setSc_title(rs.getString("sc_title"));
				dto.setSc_content(rs.getString("sc_content"));
				dto.setSc_regdate(rs.getString("sc_regdate"));
				dto.setSc_state(rs.getString("sc_state"));
				dto.setSc_type(rs.getString("sc_type"));
				dto.setSc_num(rs.getString("sc_num"));
				dto.setU_id(rs.getString("u_id"));
				list.add(dto);
				}
		}
		catch(Exception err){
			System.out.println("getBoardList() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return list;
	}
	//글 읽기
	public c_board getRead (String num){
		/**
		 * 글 읽기 메소드입니다.
		 * @param c_board dto 반환할 값을 저장해둘 변수
		 * @return c_board dto dto로 반환합니다.
		 */
		c_board dto = new c_board();
		
		sql = "select * from service_center where sc_num='"+num+"'";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				dto.setSc_title(rs.getString("sc_title"));
				dto.setU_id(rs.getString("u_id"));
				dto.setSc_content(rs.getString("sc_content"));
				dto.setSc_regdate(rs.getString("sc_regdate"));
				dto.setSc_state(rs.getString("sc_state"));
				dto.setSc_type(rs.getString("sc_type"));
				dto.setSc_num(rs.getString("sc_num"));
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
	//답변 읽기
	public String getReadAs (String num){
		/**
		 * 답변 읽기 메소드입니다.
		 * @return String as 답변을 문자열로 반환합니다.
		 */
		String as=null;
		sql = "select * from service_center_as where sc_num='"+num+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				as = rs.getString("sca_answer");
				}
		}
		catch(Exception err){
			System.out.println("getReadAs() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return as;
	}
	//답변 등록
	public void reg_Ans(String num, String ans){
		/**
		 * 답변 등록  메소드입니다.
		 */
		sql = "INSERT INTO SERVICE_CENTER_AS (SC_NUM, SCA_ANSWER) VALUES (?,?)";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.setString(2, ans);
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("regC_boadr() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//답변 달았을시 완료로 변경
	public void reg_Ans_fin(String num){
		/**
		 * 답변 상태 변경 메소드입니다.
		 */
		sql = "UPDATE SERVICE_CENTER SET SC_STATE='완료' WHERE SC_NUM='"+num+"'";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("reg_Ans_fin() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//유저 비밀번호 가져오기
	public String getUserPw (String u_id){
		/**
		 * 유저 비밀번호 가져오기 메소드입니다.
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
	//유저 글 지우기
	public void DeleteUserQ (String sc_num){
		/**
		 * 유저 글 지우기 메소드입니다.
		 */
		sql = "delete from service_center where sc_num='"+sc_num+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("DeleteUserQ() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//답변 삭제
	public void DeleteAns (String sc_num){
		/**
		 * 답변 삭제 메소드입니다.
		 */
		sql = "delete from service_center_as where sc_num='"+sc_num+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("DeleteAns() 에서 오류 : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
}
