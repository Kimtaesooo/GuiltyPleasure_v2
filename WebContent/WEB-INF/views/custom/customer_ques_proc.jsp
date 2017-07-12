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
		
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("u_id");
		if(title!=null&&type!=null&&content!=null&&id!=null){
			dto.setSc_title(title);
			dto.setSc_type(type);
			dto.setSc_content(content);
			dto.setU_id(id);
			dao.regC_board(dto);
		
		}
%>
<title>글 등록</title>
</head>
<body>
<script>
			alert("등록되었습니다.");
			location.replace("customer_list.jsp");  
</script>

</body>
</html>