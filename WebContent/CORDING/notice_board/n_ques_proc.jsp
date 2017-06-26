<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dao" class="dao.noticemodule.notice"/>
<jsp:useBean id="dto" class="dto.Notice"/>
<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
	
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("u_id");
		String nick = dao.getUserNick(id);
		if(title!=null&&type!=null&&content!=null&&id!=null){
			dto.setN_title(title);
			dto.setU_id(id);
			dto.setU_nickname(nick);
			dto.setN_content(content);
			
			dao.regN_board(dto);
		}
%>
<title>글 등록</title>
</head>
<body>
<script>
			alert("등록되었습니다.");
			location.replace("n_list.jsp");  
</script>

</body>
</html>