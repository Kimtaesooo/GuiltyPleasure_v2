
<%@ page import="dto.UserInfo"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.loginmodule.Resistration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.loginmodule.Resistration"/>
	<jsp:useBean id="dto" class="dto.UserInfo"/>
	<jsp:setProperty name="dto" property="*"/>

<%
	dao.regUser(dto);
	//dao.regUser(U_ID, U_PW, U_NAME, U_NICKNAME, U_PHONE, U_EMAIL, U_ADDR, U_POSTNUMBER, U_BIRTH, U_GENDER, 
	//U_INTRODUCE, U_REGDATE, U_POINT, U_POWER, U_DELETE, U_QUESTION, U_ANSWER, U_COMMENT	)
%>
<%
		response.sendRedirect("login_reg.html");		
%>
