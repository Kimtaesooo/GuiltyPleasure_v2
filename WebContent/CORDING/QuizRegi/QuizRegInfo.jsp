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
	<input type="hidden" name = "power" value="user"/>
	<input type="submit" value="확인">
	<input type="reset" value= "취소">
</form>
<!-- 관리자 form 아이디를 가져와서 둘중 하나만 보이게 바꿔야됨 -->
<form action="/GuiltyPleasure/borad">
	<input type="hidden" name = "cmd" value="QREGI_BOARD_LIST"/>
	<input type="hidden" name = "power" value="master"/>
	<input type="submit" value="확인">
	<input type="reset" value= "취소">
</div>
</body>
</html>