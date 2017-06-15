<%@ page import="dao.boardmodule.FreeBoard"%>
<%@ page import="dto.Board"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard"/>
	<jsp:useBean id="dto" class="dto.Board"/>
	<jsp:setProperty name="dto" property="*"/>	
	
<%
	String u_id = request.getParameter("u_id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	dao.regBoard(u_id, title, content);
	/*
	request.setAttribute("dto", °á°ú);
	${dto.u_id}
	*/
%>
	 	
	
	
<%	
	response.sendRedirect("BoardList.jsp");
%>