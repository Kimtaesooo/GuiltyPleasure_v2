<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="dao" class="dao.customermodule.customer"/>
<jsp:useBean id="dto" class="dto.c_board"/>
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String num = request.getParameter("sc_num");
		String answer = request.getParameter("sca_answer");
		
		dao.reg_Ans(num, answer);	
		dao.reg_Ans_fin(num);
%>
<title>답변 등록</title>
</head>
<body>
<%response.sendRedirect("customer_list.jsp");%>

</body>
</html>