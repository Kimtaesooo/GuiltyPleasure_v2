<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dao" class="dao.noticemodule.notice"/>
<jsp:useBean id="dto" class="dto.Notice"/>

		<%
			String n_num = request.getParameter("num");
			dao.deleteBoard(n_num);
			response.sendRedirect("/GuiltyPleasure/notice?cmd=list");
		%>
