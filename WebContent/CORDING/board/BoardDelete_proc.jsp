<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard"/>
	<jsp:useBean id="dto" class="dto.Board">
		<jsp:setProperty name="dto" property="*"/>
	</jsp:useBean>
	
<%		
	dao.deleteBoard(dto.getB_num());
	response.sendRedirect("BoardList.jsp");
%>