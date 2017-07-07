<%@page import="dto.U_Quiz"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>quiz등록</title>
<%
	U_Quiz uq = (U_Quiz) request.getAttribute("uq");
	String u_id = (String) session.getAttribute("u_id");
%>
<script>
	window.onload = function(){
		document.form.genre.value = '<%=uq.getQ_type()%>';
	};
	
	//문제수정시 설정된 입력공간이 빈공간인지 비교하여 처리하는 함수
	function updatequiz() {		
		if($("#regQuiz").val()== 'Y'){
			alert('승인된 문제는 수정 불가능합니다.');
			return ;
		}
		if ($("#problem").val() == "") {
			alert("문제를 입력하세요");
			return false;
		}

		if ($("#genre option:selected").val() == "") {
			alert("유형을 선택하세요");
			return false;
		}
		
		if ($("#answer").val() == "") {
			alert("정답을 입력하세요")
			return false;
		}

		if ($("#wrong1").val() == "") {
			alert("오답1을 입력하세요")
			return false;
		}
		
		if ($("form #wrong2").val() == "") {
			alert("오답2를 입력하세요")
			return false;
		}

		if ($("#wrong3").val() == "") {
			alert("오답3을 입력하세요")
			return false;
		}
		document.form.select.value = document.getElementById('genre').value;
		document.form.action="/GuiltyPleasure/QuizRegister";
		document.form.cmd.value="UPDATE";
		document.form.submit();
	}
	
	//삭제버튼 클릭시 처리되는 함수
	function delquiz(){
		if($("#regQuiz").val()== 'Y'){
			alert('승인된 문제는 삭제 불가능합니다.');
			return ;
		}
		document.form.action="/GuiltyPleasure/QuizRegister";
		document.form.cmd.value="DELETE";
		document.form.submit();
	}
	
	//퀴즈 등록시 처리되는 함수
	function regquiz(){
		document.form.action="/GuiltyPleasure/QuizRegister";
		document.form.cmd.value="REG";
		document.form.submit();
	}
</script>
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
<!-- Owl Carousel -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
<!-- toCount -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
<!-- Main JS -->
<script
	src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
<!-- Simple Line Icons-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
<!-- Salvattore -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- nav바 수정부분 -->
<style>
.fh5co-nav-toggle>span {
	color: #333;
}

a {
	color: #333;
}

.navbar-brand {
	color: #333;
}

#fh5co-offcanvass .fh5co-lead {
	font-size: 15px;
	color: #333;
}

.navbar-brand>span {
	border: 2px solid #333;
}

.navbar-brand:hover {
	color: #3c763d;
}

a {
	color: #333;
}

#fh5co-offcanvass {
	background: #d3d9da;
	color: #878c93;
}

button, input, optgroup, select, textarea {
	height: 30px;
}
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<body>
	<jsp:include page="/test_nav.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="col-lg-12 panel panel-success">
			<div class="form-group">
				<label for="textProblem">문제 수정</label>
				<form method="POST" id="form" name="form">
					<input type="hidden" name="regQuiz" id="regQuiz" value="<%=uq.getUq_adopt() %>"/>
					<input type="hidden" name="qnum" id="qnum" value="<%=uq.getUq_num() %>"/>
					<input type="hidden" name="select" id="select" />
					<input type="hidden" name="cmd" value="QUIZ_REGI" />
					<div class="container">
						<div class="row">
							<div class="col-md-5">
								<div class="form-group">
									<label for="textProblem">문제</label>
									<textarea name="textProblem"
										id="problem" class="form-control"><%=uq.getUq_question()%></textarea>
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
									<label for="textAnswer">정답</label> <input type="text"
										value="<%=uq.getUq_answer()%>" name="textAnswer" id="answer"
										class="form-control" />
								
								</div>
								<input type="text" class="form-control"
									value="<%=uq.getUq_wa_a()%>" id="wrong1" name="w1" /> 
								<br>
								<input
									type="text" class="form-control" value="<%=uq.getUq_wa_b()%>"
									id="wrong2" name="w2" /> 
								<br>
								<input type="text"
									class="form-control" value="<%=uq.getUq_wa_c()%>" id="wrong3"
									name="w3" />
								<div id="confirm"></div>
								<br>
<%
								if(u_id.equals("master")){
%>
									<input type="submit" onclick="javascript:regquiz()" value="관리자 퀴즈 등록" />&nbsp;
<%
								}else{
%>
									<input type="submit" onclick="javascript:updatequiz()" value="수정" /> &nbsp;									
									<input type="submit" onclick="javascript:delquiz()" value="삭제" /> &nbsp;									
<%
								} 
%>
								<input type="reset" value="취소" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>