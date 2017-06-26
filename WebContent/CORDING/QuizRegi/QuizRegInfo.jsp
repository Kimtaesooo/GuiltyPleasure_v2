<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	div{width:500px; height:400px; border:1px solid red}
</style>
</head>
<body>
<div>
<h1>문제 등록 설명서</h1>
</div>

<!-- 이용자 form -->
<div>
<form action="/GuiltyPleasure/borad">
	<input type="hidden" name = "cmd" value="QREGI_BOARD_LIST"/>
<!-- 	<input type="hidden" name = "power"  value=""/> -->
	<input type="submit" value="확인">
	<input type="reset" value= "취소">
</form>
</body>
</html>