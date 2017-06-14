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
		
		String sc_num = request.getParameter("sc_num");
		String pw = request.getParameter("pwcheck");
		String u_id = request.getParameter("u_id");
		
		String u_pw = dao.getUserPw(u_id);
%>
<title>글 삭제</title>
</head>
<body>
<%
	if(u_pw.equals(pw)){
		dao.DeleteAns(sc_num);
		dao.DeleteUserQ(sc_num);
		response.sendRedirect("customer_list.jsp");
	}else{ 
%>
		<script>
			alert("패스워드가 틀립니다.");
			location.replace("customer_list.jsp");  
		</script>
		
<%}%>

</body>
</html>