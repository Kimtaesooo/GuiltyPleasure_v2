<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dao" class="dao.customermodule.customer"/>
<jsp:useBean id="dto" class="dto.c_board"/>
<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
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