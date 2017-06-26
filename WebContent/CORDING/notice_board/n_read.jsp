<%@page import="dao.customermodule.customer"%>
<%@page import="dto.Notice"%>
<%@page import="dao.noticemodule.notice"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<jsp:useBean id="dao" class="dao.noticemodule.notice"/>

<%
	
	Notice dto = new Notice();
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String num = request.getParameter("num");
	dao.N_Count_Update(num);
	dto = dao.getRead(num);
%>
<title>질문</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.jsp"/>

<div class="container">   
        <div class="row col-lg-12">
		
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>공지사항 작성</h1>
				</div>
				<br>
				<div class="jumbotron">
							<div class="jumbotron">
						<H2>공지사항</H2>
						<pre>글제목 : <%=dto.getN_title() %></pre>
						<pre>등록일 : <%=dto.getN_regdate() %></pre>
						<pre>작성자 : <%=dto.getU_nickname() %> </pre>
						<pre><%=dto.getN_content() %></pre>
		        </div>
		        
			</div>

        </div>
</div>
</body>
</html>