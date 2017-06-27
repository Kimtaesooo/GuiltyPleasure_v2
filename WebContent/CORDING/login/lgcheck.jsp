<%@ page import="dto.UserInfo"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.loginmodule.Login"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.loginmodule.Login"/>
	<jsp:useBean id="dto" class="dto.UserInfo"/>
	<jsp:setProperty name="dto" property="*"/>

<%
	String u_id = request.getParameter("form-username");
	String u_pw = request.getParameter("form-password");
	
	UserInfo userinfo = dao.getUser(u_id);
	
	if(u_pw.equals(userinfo.getU_pw())){
		if(u_id.equals("Master01") || u_id.equals("Master02") || u_id.equals("Master03") ||
				u_id.equals("Master04") || u_id.equals("Master05") || u_id.equals("Master06")){
			session.setAttribute("u_id", "master");			
			response.sendRedirect("/GuiltyPleasure/main.jsp");
			return;
		}
		session.setAttribute("u_id", u_id);
		session.setAttribute("u_nickname", userinfo.getU_nickname());
		response.sendRedirect("/GuiltyPleasure/main.jsp");
	}
	else{
		response.sendRedirect("login_err.html");		
	}

%>