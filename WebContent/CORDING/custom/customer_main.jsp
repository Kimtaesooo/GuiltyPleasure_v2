<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){
	$(".a1").hide(0);
	$(".a2").hide(0);
	$(".a3").hide(0);
	$(".a4").hide(0);
	$(".a5").hide(0);
	
	$(".a1").click(function(){$(".a1").hide(1000);});
	$(".a2").click(function(){$(".a2").hide(1000);});
	$(".a3").click(function(){$(".a3").hide(1000);});
	$(".a4").click(function(){$(".a4").hide(1000);});
	$(".a5").click(function(){$(".a5").hide(1000);});
	
	$(".p1").click(function(){$(".a1").show(1000);});
	$(".p2").click(function(){$(".a2").show(1000);});
	$(".p3").click(function(){$(".a3").show(1000);});
	$(".p4").click(function(){$(".a4").show(1000);});
	$(".p5").click(function(){$(".a5").show(1000);});
});
</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

%>
<title>Main</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.jsp"/>

<div class="container">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="#" class="btn btn-success active">문의</a>
        	<a href="customer_list.jsp" class="btn btn-info">문의 내역</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >문의하기</a>	
			</div>
			<br><br>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>문의 FAQ</h1>
	  			<p>고객님들이 자주 묻는 질문을 모아놨습니다 !!</p>
	  			<h5>클릭시 답변이 나타납니다.</h5>
				</div>
				<div class="jumbotron">
				<div>
					<a class="p1"> Q.포인트는 어디에 사용 하나요?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a1">A.아이템을 구매하거나 배틀플레이에 사용됩니다. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				
				<br>
				<div>
					<a class="p2"> Q.아이디를 모르겠어요?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a2">A.아이디 비밀번호 찾기를 이용하세요. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				<br>
				<div>
					<a class="p3"> Q.배틀플레이 에서 계속 지면 어떻게 되나요?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a3">A.패가 늘어나고 포인트가 깍입니다. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				<br>
				<div>
					<a class="p4"> Q.아이디/비밀번호 찾기를 이용해도 못찾겠습니다?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a4">A.고객센터에 적힌 연락처로 전화를 주세요. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
				<br>
				<div>
					<a class="p5"> Q.랭킹 계산법이 어떻게 되나요?? <span class="glyphicon glyphicon-menu-down"></span></a>
					<a><h4 class="a5">A.200판 이상한 유저들 중에 정답률이나 승률이 높은 유저를 선정합니다. <span class="glyphicon glyphicon-menu-up"></span></h4></a>
				</div>
			</div>
			</div>
			
        </div>
</div>
</body>
</html>