<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String u_id ="";
	if(session.getAttribute("u_id")!=null){
		u_id = (String)session.getAttribute("u_id");
	}
%>
</head>
<body>
<nav class="navbar navbar-default"  role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
    	<!-- 이미지 깨짐
    	<a class="navbar-brand" href="#">
    		<img alt="Brand" src="/images/quiz.jpg">
    	</a>
    	 -->
    	<a class="navbar-brand" href="/GuiltyPleasure/main.jsp"><font color="red">Guilty Pleasure</font></a>
    </div>
    <div>
    <!-- 좌측정렬 네비 바
      <ul class="nav navbar-nav">
        <li><a href="#">홈</a></li>
        <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li> 
        <li><a href="#">메뉴3</a></li> 
      </ul>
    -->
    <!-- 우측 정렬 네비 바 -->
    </div>
  </div>
</nav>
</body>
</html>