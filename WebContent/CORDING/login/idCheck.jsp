<%@page import="dto.UserInfo"%>
<%@ page import="dao.loginmodule.Login"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

	<jsp:useBean id="dao" class="dao.loginmodule.Login"/>
	<jsp:useBean id="dto" class="dto.UserInfo"/>
	<jsp:setProperty name="dto" property="*"/>
<%
	String u_id = request.getParameter("u_id");
	
	UserInfo userinfo = dao.getUser(u_id);
	
	if(userinfo.getU_id()==null){
%>
		사용 가능한 아이디 입니다.
<%
	}
	else{
%>
		사용 불가능한 아이디입니다.
<%
	}
%>