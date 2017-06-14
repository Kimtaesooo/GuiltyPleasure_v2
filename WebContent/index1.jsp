<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("id", "TEST01");
%>
	<a href="/GuiltyPleasure/myinfo?cmd=MYINFO">내정보</a><br>
	<a href="/GuiltyPleasure/userinfo?cmd=LIST">유저정보</a><br>
</body>
</html>
