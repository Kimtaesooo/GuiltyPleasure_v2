<%@ page import="java.util.List"%>
<%@ page import="dao.playmodule.MakeRoom"%>
<%@ page import="dto.BattleRoom"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	String u_id = (String)session.getAttribute("u_id");
%>
	<jsp:useBean id="dao" class="dao.playmodule.MakeRoom"/>
	<jsp:useBean id="dto" class="dto.BattleRoom"/>
	<jsp:setProperty name="dto" property="*"/>

<%
	dao.regRoom(dto, u_id);
	//response.sendRedirect("login_err.html");
%>
"C:/Users/KimTaesoo/Desktop/education/education/index.html"
