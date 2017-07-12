<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
function check(){
	if(document.que.title.value == ""){
		alert("제목을 입력해주세요.");
		document.que.title.focus();
		return;
	}

	if(document.que.content.value == ""){
		alert("내용을 입력해주세요.");
		document.que.content.focus();
		return;
	}
	document.que.submit();
}
</script>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

%>
<title>질문</title>
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
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<body>
<jsp:include page="/nav.jsp"/>
<br><br><br><br><br>

<div class="container" id="fh5co-main">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success">문의</a>
        	<a href="customer_list.jsp" class="btn btn-info">문의 내역</a>
			</div>
			
			<div class="col-lg-8" align="right">
			<a href="#" class="btn btn-warning active" >문의하기</a>	
			</div>
			<br>
			<br>
			<%if(session.getAttribute("u_id")!=null){%>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>문의하기</h1>
	  			<p>자세히 작성해 주셔야 빠르고 정확한 답변이 가능합니다 !</p>
				</div>
				<br>
				<div class="jumbotron">
				<form action="customer_ques_proc.jsp" method="post" name="que">
				<div class="form-group">
				<label class="control-label" >제목</label>
				<input class="form-control"  type="text" name="title" >
				<br>	
				<label class="control-label" >분류</label>
				<select class="form-control" id="type" name="type">
		          <option>환불/교환</option>
		          <option>시스템 장애</option>
		          <option>제안</option>
		          <option>싱글플레이</option>
		          <option>배틀플레이</option>
		          <option>상점</option>
		          <option>랭킹</option>
		          <option>퀴즈</option>
		          <option>가입/탈퇴</option>
		          <option>포인트 결제</option>
		          <option>기타</option>
		        </select>
		        <br>
		        <label class="control-label" >내용</label>
		        <textarea class="form-control" rows="10" id="content" name="content"></textarea>
		        </div>
		        <a href="javascript:check()" class="btn btn-primary">문의</a>
		        <button type="reset" class="btn btn-default">다시작성</button>	 
		        </form>
		        </div>
		        
			</div>
			<%}else{ %>
				<div class="col-lg-12 panel panel-success">
				<br>
					<div class="jumbotron">
		  			<h2>로그인 후 이용가능한 서비스 입니다.</h2>
		  			<p><a href="${pageContext.request.contextPath}/CORDING/login/resistration.html">회원가입</a> 혹은 <a href="${pageContext.request.contextPath}/CORDING/login/login.html">로그인</a>을 해주세요</p>
					</div>
				</div>
			<%} %>
        </div>
</div>
</body>
</html>