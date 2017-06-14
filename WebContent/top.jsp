<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="bootstrap332/css/bootstrap.min.css">
<script src="bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="bootstrap332/js/bootstrap.min.js"></script>
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
      <ul class="nav navbar-nav navbar-right">
      	<%if(u_id.length()==0){%>
        	<li><a href="/GuiltyPleasure/CORDING/login/login.html">로그인</a></li>
        	<li><a href="/GuiltyPleasure/CORDING/login/resistration.html">회원가입</a></li>
        	<li><a href="/GuiltyPleasure/CORDING/login/idpw.jsp">아이디/비밀번호 찾기</a></li>
        <%} %>
        <%if(u_id.length()>0){%>
        	<li><a><%=u_id%>님 환영합니다.</a></li>
        	<li><a href="/GuiltyPleasure/myinfo?cmd=MYINFO">마이페이지</a></li>
        	<li><a href="CORDING/login/logout.html">로그아웃</a></li>
        	<%if(u_id.equals("master")){ %>
        		<li><a href="/GuiltyPleasure/userinfo?cmd=LIST">회원관리</a>
        	<%}%>
        <%}%>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>