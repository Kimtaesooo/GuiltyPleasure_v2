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
<title>Insert title here</title>
<%
	int counter =(int)request.getAttribute("counter");
	request.setCharacterEncoding("euc-kr");
	Quiz quiz = (Quiz) request.getAttribute("quiz");
	CheckQuiz check = new CheckQuiz();
	check.setQuizList(quiz);
	ArrayList quizlist = check.getQuizList();
%>
<script>
var result = new Array();
	function answerCheck(i){
	<%//출력된 문제의 정보 일부를 클래스에 저장해서 보관
			//result.setU_id(session.getAttribute("u_id")); 유저 아이디도 집어넣을것%>	
		if(counter>0){
			select = document.getElementById("text"+i).value;
			combocheck(select, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&counter="+counter+"&result="+result;
		}else	if(counter==0){
			select = document.getElementById("text"+i).value;
			combocheck(select, counter);
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_RESULT&result="+result+"&step=FINAL";
		}else if(counter<0){
				clearInterval(tid);
			}
	}
	function combocheck(select, j){
		result[0] ="<%=quiz.getQ_code()%>"
		result[1]= "<%=quiz.getQ_type()%>"
		answer = "<%=quiz.getQ_answer()%>"
		if (select == answer) {
			alert("정답입니다 " + select + ". 남은 문제수 :" + j);
			result[2] = "o";
	} else if (select != answer) {
			alert("오답입니다.  " + select + " 남은 문제수 :" + j);
			result[2] = "x";
	}
	}
</script>
<script>
	var counter = <%=counter%>
	time = 1105;
	function timer(){
		var text = document.getElementById("time");
		text.innerHTML= time;
		time--;
		if(time < 0){
			clearInterval(tid);
			if(counter>1){
			counter--;
			location.href="/GuiltyPleasure/quiz?cmd=QUIZ_GET&counter="+counter;
			alert("남은 게임 숫자"+counter)
			}else if(counter =1){
				alert("문제 끝")
				clearInterval(tid);
			}
		}
	}
	window.onload = function(){
		tid = setInterval('timer()', 1000);
	}
</script>
</head>
<body>
	<h1>싱글 플레이 시작</h1>

	<div style="float: left; width: 60%">
		첫번째 영역
		<div style="width: 60%; height: 300px">
			퀴즈 문제가 나오는 곳
			<h2>${quiz.getQ_question()}</h2>
		</div>
		<div style="width: 60%; height: 100px">
			퀴즈 보기가 나오는 곳
		<div>
		<input type="button" value="<%=quizlist.get(0)%>" id="text1"onclick="answerCheck(1);" /> 
		<input type="button" value="<%=quizlist.get(1)%>" id="text2" onclick="answerCheck(2);" />
		<input type="button" value="<%=quizlist.get(2)%>" id="text3" onclick="answerCheck(3);" />
		<input type="button" value="<%=quizlist.get(3)%>" id="text4" onclick="answerCheck(4);" />
		</div>
		
		<div style="float: right; width: 50%">
			<input type="button" value="포기하기"/>
		</div>
		</div>
		<div id="time" style="float: left; width: 50%">
		</div>
	</div>
	<div style="border: 2px solid; float: right; width: 30%; height: 300px">
		두번째 영역입니다.
		<c:if test="${combo ne null}">
			콤보를 출력합니다.
		</c:if>
	</div>
</body>
</html>