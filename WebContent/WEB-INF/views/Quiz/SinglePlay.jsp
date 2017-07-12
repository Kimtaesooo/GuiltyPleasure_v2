<%@page import="dao.quizmodule.CheckQuiz"%>
<%@page import="dto.Quiz"%>
<%@page import="dto.QuizResult"%>
<%@page import="dao.quizmodule.QuizRegister"%>
<%@page import="dao.quizmodule.CheckQuiz"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Quiz"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script>
$(document).ready(function(){
	$("#board").css("background","black").css("color","white").css("font-size","xx-large");

});
</script>
<script>
var isFirst = false;
$(document).keyup(function (e) {
	if(e.which == 49) isFirst=false;
	}).keydown(function (e) {
	    if(e.which == 49) isFirst=true;
	    if( isFirst == true) {
	    	answerCheck(1);
	 	return false;
	 }
});
var isSecond = false;
$(document).keyup(function (e) {
	if(e.which == 50) isSecond=false;
	}).keydown(function (e) {
	    if(e.which == 50) isSecond=true;
	    if( isSecond == true) {
	    	answerCheck(2);
	 	return false;
	 }
});
var isThird = false;
$(document).keyup(function (e) {
	if(e.which == 51) isThird=false;
	}).keydown(function (e) {
	    if(e.which == 51) isThird=true;
	    if( isThird == true) {
	    	answerCheck(3);
	 	return false;
	 }
});
var isFourth = false;
$(document).keyup(function (e) {
	if(e.which == 52) isFourth=false;
	}).keydown(function (e) {
	    if(e.which == 52) isFourth=true;
	    if( isFourth == true) {
	    	answerCheck(4);
	 	return false;
	 }
});
</script>
<title>Insert title here</title>
<%
	int counter =(Integer)request.getAttribute("counter");
	request.setCharacterEncoding("UTF-8");
	Quiz quiz = (Quiz) request.getAttribute("quiz");
	CheckQuiz check = new CheckQuiz();
	check.setQuizList(quiz);
	ArrayList quizlist = check.getQuizList();
%>
<script>
var result = new Array();
//보기를 눌렀을시 정답인지 오답인지 확인후 확인된 결과를 servlet으로 가서 저장 하는 함수
	function answerCheck(i){
	<%//출력된 문제의 정보 일부를 클래스에 저장해서 보관
			//result.setU_id(session.getAttribute("u_id")); 유저 아이디도 집어넣을것%>	
		if(counter>0){
			select = document.getElementById("text"+i).value;
			combocheck(select, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&counter="+counter+"&result="+result+"&method=SINGLE";
		}else	if(counter==0){
			select = document.getElementById("text"+i).value;
			combocheck(select, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&result="+result+"&step=FINAL"+"&method=SINGLE";
		}else if(counter<0){
				clearInterval(tid);
			}
	}
	//보기가 정답인지 오답인지 확인하는 클래스
	function combocheck(select, j){
		result[0] ="<%=quiz.getQ_code()%>"
		result[1]= "<%=quiz.getQ_type()%>"
		answer = "<%=quiz.getQ_answer()%>"
		if (select == answer) {
		//	alert("정답입니다 " + select + ". 남은 문제수 :" + j);
			result[2] = "o";
	} else if (select != answer) {
		//	alert("오답입니다.  " + select + " 남은 문제수 :" + j);
			result[2] = "x";
	}
	}
</script>
<script>
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
textarea.form-control {
	height: auto;
	background-color: #ece6e6;
	font-size: 25px;
}
.btn-primary {
  background: #94a09f;
  font-size: 15px;
}

</style>

</head>
<body>
<jsp:include page="/nav.jsp"/>
	<br>
	<br>
		<h2>
			<p class="text-center">싱글 게임 시작</p>
		</h2>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="5" id="board">${quiz.getQ_question()}</textarea>
			<br><br><br>
			<p>
			<div class="col-lg-12">
				<div class="col-lg-3">
	  			<input type="button" class="btn btn-primary btn-lg btn-block" value="<%=quizlist.get(0)%>" id="text1"onclick="answerCheck(1);" /> 
				</div>
				<div class="col-lg-3">
				<input type="button" class="btn btn-primary btn-lg btn-block" value="<%=quizlist.get(1)%>" id="text2" onclick="answerCheck(2);" />
				</div>
				<div class="col-lg-3">
				<input type="button" class="btn btn-primary btn-lg btn-block" value="<%=quizlist.get(2)%>" id="text3" onclick="answerCheck(3);" />
				</div>
				<div class="col-lg-3">
				<input type="button" class="btn btn-primary btn-lg btn-block" value="<%=quizlist.get(3)%>" id="text4" onclick="answerCheck(4);" />
	  			</div>
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
</html>