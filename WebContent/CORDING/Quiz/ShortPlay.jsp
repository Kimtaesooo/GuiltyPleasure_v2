<%@page import="dao.quizmodule.CheckQuiz"%>
<%@page import="dto.Quiz"%>
<%@page import="dto.QuizResult"%>
<%@page import="dao.quizmodule.QuizRegister"%>
<%@page import="dao.quizmodule.CheckQuiz"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Quiz"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script>
$(document).ready(function(){
	$("#board").css("background","black").css("color","white").css("font-size","xx-large");

});
</script>
<title>Insert title here</title>
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
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
.fh5co-counter-label {
  font-size: 20px;
}
</style>
<%

	int counter =(Integer)request.getAttribute("counter");
	request.setCharacterEncoding("euc-kr");
	Quiz quiz = (Quiz) request.getAttribute("quiz");
	CheckQuiz check = new CheckQuiz();
	//check.setQuizList(quiz);
	//ArrayList quizlist = check.getQuizList();
%>
<script>
var result = new Array();
//보기를 눌렀을시 정답인지 오답인지 확인후 확인된 결과를 servlet으로 가서 저장 하는 함수
	function answerCheck(){
		if(counter>0){
			text = document.getElementById("text").value;
			combocheck(text, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&counter="+counter+"&result="+result+"&method=SHORT";
		}else	if(counter==0){
			text = document.getElementById("text").value;
			combocheck(text, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&result="+result+"&step=FINAL"+"&method=SHORT";
		}else if(counter<0){
				clearInterval(tid);
			}
	}
//보기가 정답인지 오답인지 확인하는 클래스
	function combocheck(text, j){
		result[0] ="<%=quiz.getQ_code()%>"
		result[1]= "<%=quiz.getQ_type()%>"
		answer = "<%=quiz.getQ_answer()%>"
		if (text == answer) {
			alert("정답입니다 " + text + ". 남은 문제수 :" + j);
			result[2] = "o";
			result[3] = text;
			result[4] = answer
	} else if (text != answer) {
			alert("오답입니다. 정답은 " + answer + "입니다.  남은 문제수 :" + j);
			result[2] = "x";
			result[3] = text;
			result[4] = answer
	}
	}
	
//페이지에 타이머 기능을 부여하여 제한시간을 두는 함수
	var counter = <%=counter%>
	time = 30;
	function timer(){
		var text = document.getElementById("time");
		text.innerHTML= time;
		time--;
		if(time < 0){
			clearInterval(tid);
			if(counter>1){
			counter--;
			result[0] ="<%=quiz.getQ_code()%>"
				result[1]= "<%=quiz.getQ_type()%>"
				result[2]="x"
				result[3]="시간초과";
				location.href="/GuiltyPleasure/quiz?cmd=QUIZ_GET&counter="+counter+"&result="+result;
				//alert("남은 게임 숫자"+counter)
			}else if(counter =1){
				alert("문제 끝")
				clearInterval(tid);
			}
		}
	}
	
//게임 포기 버튼을 클릭시 servlet으로 보내는 함수
	function giveup() {
		location.href="/GuiltyPleasure/giveup?cmd=GIVEUP"
	}
	window.onload = function(){
		tid = setInterval('timer()', 1000);
	}
</script>
</head>
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br>
		<h2>
			<p class="text-center">싱글 게임 시작</p>
		</h2>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<div  class="form-control"   id="board" 
			style="background-color:#878bdc; height:200px"><font size="6" color="white">
			${quiz.getQ_question()}</font>
			</div>
			<br><br><br>
			<p>
			<div class="col-lg-12">
				<input type="test"  id="text" size="60"> 
				<input type="button" id="input" onclick="answerCheck();" value="입력"> 
  			</div>

			</p>
		</div>
		
		<div class="col-xs-3">
			<div>
				<h3>
					제한시간 
					<label id="time">0</label>
				</h3>	
			</div>
			<br>
			<table border="0">
			<tr><th><h2>COMBO</h2></th></tr>
			<tr><th align="center"><h2>
			<c:if test="${combo ne null}">
			</c:if>0</h2></th>
			</tr>
			</table>
			<br><br>
				  <div class="col-lg-4">
	  			<input type="button" value="포기하기" class="btn btn-danger btn-lg" onclick="giveup()"/>
  				</div>

		</div>
	</div>
</body>
</body>
</html>