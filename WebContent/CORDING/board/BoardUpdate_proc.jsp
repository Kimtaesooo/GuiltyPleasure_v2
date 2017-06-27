<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard"/>
	<jsp:useBean id="dto" class="dto.Board"/>
	<jsp:setProperty name="dto" property="*"/>
	
<%
		 dao.updateBoard(dto);
%>
	 
<%
		response.sendRedirect("BoardRead.jsp?b_num="+dto.getB_num());
%>