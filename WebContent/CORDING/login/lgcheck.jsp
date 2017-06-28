<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="dao.loginmodule.Login"/>
<jsp:useBean id="dto" class="dto.UserInfo"/>
<jsp:useBean id="userdao" class="dao.UserInfoDAO"/>
<jsp:useBean id="userdto" class="dto.UserInfoDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String u_id = request.getParameter("form-username");
	String u_pw = request.getParameter("form-password");
	String message = "";
	
	dto = dao.getUser(u_id);
	userdto = userdao.searchUserInfo(u_id);
	
	if(u_pw.equals(dto.getU_pw())){
		if(userdto.getNo_entry() != null || dto.getU_delete().equals("Y")){
			response.sendRedirect("login_ban.html");
			return;
		}
		if(dto.getU_power() == 5000){
			session.setAttribute("u_id", "master");			
			response.sendRedirect("/GuiltyPleasure/main.jsp");
			return;
		}
		session.setAttribute("u_id", u_id);
		session.setAttribute("u_nickname", dto.getU_nickname());
		response.sendRedirect("/GuiltyPleasure/main.jsp");
	}
	else{
		response.sendRedirect("login_err.html");		
	}
%>
