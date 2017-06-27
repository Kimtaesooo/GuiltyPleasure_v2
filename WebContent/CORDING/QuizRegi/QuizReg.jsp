<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
function Check(){
	alert("체크를 시작합니다");
	if($("#problem").val()==""){
		alert("문제를 입력하세요");
		return false;
	}else if($("#genre option:selected").val()==""){
		alert("유형을 선택하세요");
		return false;
	}else if($("#answer").val()==""){
		alert("정답을 입력하세요")
		return false;
	}else if($("#wrong1").val()==""){
		alert("오답1을 입력하세요")
		return false;
	}else if($("form #wrong2").val() == ""){
		alert("오답2를 입력하세요")
		return false;
	}else if($("#wrong3").val()=""){
		alert("오답3을 입력하세요")
		return false;
	}else{
		return true;
	}
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
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br>
<form method="POST" action="../../../GuiltyPleasure/QuizRegister"  onSubmit="return Check()">
<input type="hidden" name="cmd" value="QUIZ_REGI"/>
<div class="container">
	<div class="col-lg-12 panel panel-success">
				<div class="form-group">
					<label for="textProblem"><h2>문제</h2></label> <textarea
						placeholder="문제입력"  name="textProblem" id="problem" class="form-control" ></textarea>
					</div>
				<select name="genre" id="genre">
					<option value="">문제 유형 선택</option>
					<option value="넌센스">넌센스</option>
					<option value="상식">상식</option>
					<option value="기타">기타</option>
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
				</div>
					<input type= "submit" value="문제 제출" />
					&nbsp;&nbsp;&nbsp;
					<input type ="reset" value="취소" />
					<br><br>
	
	</div>
</div>
</form>
</body>
</html>