<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<p class="text-center">배틀 게임 시작</p>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="16" placeholder="퀴즈 문제 출력 되는 곳"></textarea>
			<br><br><br>
			<p>
			<div class="col-md-3">
  			<button type="button" class="btn btn-primary btn-lg">Large button</button>
  			</div>
			<div class="col-md-3">
  			<button type="button" class="btn btn-primary btn-lg">Large button</button>
  			</div>
			<div class="col-md-3">
  			<button type="button" class="btn btn-primary btn-lg">Large button</button>
  			</div>
			<div class="col-md-3">
  			<button type="button" class="btn btn-primary btn-lg">Large button</button>
  			</div>
			</p>
		</div>
		
		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="접속자 확인 하는 곳"></textarea>
			<br>
			<textarea class="form-control" rows="13" placeholder="채팅이 실현 되는 곳"></textarea>
			<br>
			<form class="form-horizontal">
				<div class="col-xs-9">
					<input type="text" class="form-control" id="exampleInputName2" placeholder="채팅을 입력하세요.">
				</div>
					<div class="col-xs-2">
				<button type="submit" class="btn btn-default">전송</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>