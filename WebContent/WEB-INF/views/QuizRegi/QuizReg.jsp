<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
//문제등록시 설정된 입력공간이 빈공간인지 비교하여 처리하는 함수
function check(v){	
	if($("#problem").val()==""){
		alert("문제를 입력하세요");
		return false;
	}
	
	if($("#genre option:selected").val()==""){
		alert("유형을 선택하세요");
		return false;
	}
	
	if($("#answer").val()==""){
		alert("정답을 입력하세요")
		return false;
	}
	
	if($("#wrong1").val()==""){
		alert("오답1을 입력하세요")
		return false;
	}
	
	if($("form #wrong2").val() == ""){
		alert("오답2를 입력하세요")
		return false;
	}
	
	if($("#wrong3").val()==""){
		alert("오답3을 입력하세요")
		return false;
	}
	document.form.select.value = document.getElementById('genre').value;
	document.form.cmd.value = v;
	document.form.submit();
	}

</script>
<title>quiz등록</title>
<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
	<!-- Owl Carousel -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
	<!-- toCount -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
	<!-- Simple Line Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
<!-- nav바 수정부분 -->	
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
button,
input,
optgroup,
select,
textarea {
  height: 30px;
}
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<%
	String u_id = (String)session.getAttribute("u_id");
%>
<body>
<jsp:include page="/nav.jsp"/>
<br><br><br><br><br>
<form method="POST" action="../../../GuiltyPleasure/QuizRegister" name="form" id="form">
<input type="hidden" name="cmd"/>
<input type="hidden" name="select" id="select"/>
<div class="container">
	<div class="col-lg-12 panel panel-success">
				<div class="form-group">
					<label for="textProblem"><h2>문제</h2></label> <textarea
						placeholder="문제입력"  name="textProblem" id="problem" class="form-control" ></textarea>
					</div>
				<select name="genre" id="genre">
					<option value="">문제 유형 선택</option>
					<option value="A">넌센스</option>
					<option value="B">상식</option>
					<option value="C">기타1</option>
					<option value="D">기타2</option>
				</select>
				<br><br>
					<div class="form-group">
						<label for="textAnswer"><h2>정답</h2></label> 
						<input type="text" placeholder="정답 입력"  name="textAnswer"  id="answer"  class="form-control" />
					</div>
					<input type="text" class="form-control"  placeholder="오답1"  id ="wrong1"  name="w1"/><br>
					<input type="text" class="form-control"  placeholder="오답2"  id ="wrong2"  name="w2"/><br>
					<input type="text" class="form-control"  placeholder="오답3"  id ="wrong3"  name="w3"/><br>
				<div id="confirm">
<%
					if(u_id.equals("master")){ 
%>
						<input type ="button" onclick="javascript:check('MQUIZ_REGI')" value="바로 등록" />&nbsp;&nbsp;&nbsp;
<%
					}else{
%>
						<input type= "button" onclick="javascript:check('QUIZ_REGI')" value="문제 제출" />	&nbsp;&nbsp;&nbsp;
<%
					}
%>
					<input type ="reset" value="취소" />
					<br><br>
				</div>
	</div>
</div>
</form>
</body>
</html>