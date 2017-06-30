<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>게임을 시작합니다.</h1>
	<h1>버튼을 눌러주세요</h1>
	
	
	<div>
		<c:import url="magicEye1.jsp"></c:import>
		<input type="button" value="정답보기"/>
	</div>
		
	<div>
		<c:import url="magicEye2.jsp"></c:import>
		<input type="button" value="정답보기"/>
	</div>
	
</body>
</html>