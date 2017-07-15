<%@page import="dto.UserInfo"%>
<%@ page import="dao.loginmodule.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<jsp:useBean id="dao" class="dao.loginmodule.Login"/>
	<jsp:useBean id="dto" class="dto.UserInfo"/>
	<jsp:setProperty name="dto" property="*"/>
<%
	String u_id = request.getParameter("u_id"); // 유저가 입력한 id값 받아 옴
	
	UserInfo userinfo = dao.getUser(u_id); // 유저가 입력한 id값이 있는지 없는지 DB에 조회
	
	// resistration.html의  AJAX에 사용된다.
	// DB에 등록된 아이디가 없다면
	if(userinfo.getU_id()==null){
%>
		사용 가능한 아이디입니다.
<%
	}
	// DB에 등록된 아이디가 있다면
	else{
%>
		사용 불가능한 아이디입니다.
<%
	}
%>