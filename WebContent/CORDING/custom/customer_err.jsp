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
	
	String id ="";

	if(session.getAttribute("u_id")!=null){
	id = (String)session.getAttribute("u_id");
	}
	List list = dao.getBoardList(id);
	
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
        	<a href="customer_list.jsp" class="btn btn-info">문의 내역</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >문의하기</a>	
			</div>
			<br><br>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
				<h2>글 등록에 오류가 발생하였습니다.<span class="glyphicon glyphicon-trash"></span></h2><br>
				<h4>공백이 있나 확인해주세요</h4>
				</div>
			
        </div>
</div>
</div>
</body>
</html>