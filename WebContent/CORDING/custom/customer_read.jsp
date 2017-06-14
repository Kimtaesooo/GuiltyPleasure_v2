<%@page import="dto.c_board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<jsp:useBean id="dao" class="dao.customermodule.customer"/>

<script>

</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String sc_num = request.getParameter("sc_num");
	c_board dto = new c_board();
	dto = dao.getRead(sc_num);
%>


<title>Main</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.html"/>

<div class="container">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success ">문의</a>
        	<a href="#" class="btn btn-info active">문의 내역</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >문의하기</a>	
			</div>
			<br><br>
			<div class="jumbotron">
			<H2><span class="glyphicon glyphicon-user"></span>문의내용</H2>
			<pre>글제목 : <%=dto.getSc_title() %></pre>
			<pre>등록일 : <%=dto.getSc_regdate() %></pre>
			<pre>처리상태 : <%=dto.getSc_state() %> </pre>
			<pre><%=dto.getSc_content() %>
			
			
			
			</pre>
			
			<H2><span class="glyphicon glyphicon-arrow-right"></span>답변</H2>
			<pre>
			
			
			
			</pre>
			<a href="customer_main.jsp" class="btn btn-primary ">목록으로</a>
			</div>
	</div>
</div>
</body>
</html>