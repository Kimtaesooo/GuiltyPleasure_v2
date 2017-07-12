<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제 등록 설명</title>
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
#fh5co-hero .fh5co-overlay { background: #f5f5f5;}
#fh5co-hero .fh5co-intro h2 {color: #333333;}
#fh5co-hero .fh5co-intro p {color: #333333;}
.btn-primary {
  background: #4fd2c2;
  font-size: 15pt;
}
input, button, select, textarea {
    color: black;
}
</style>
</head>
<%
	String u_id = (String)session.getAttribute("u_id");
%>
<body>
<!--리스트로 안가져요 -->
<jsp:include page="/nav.jsp"/>
			<header id="fh5co-hero" data-section="home" role="banner" style="background: WHITE top left; background-size: cover;" >
				<div class="fh5co-intro">
					<div class="container">
						<div class="row">		
							<div class="col-md-6 fh5co-text">
								<h2 class="to-animate intro-animate-1">문제 등록 이 뭔가요? </h2>
								<p class="to-animate intro-animate-2">자신이 문제를 출제하고 관리자가 검토후에 문제 등록이 진행됩니다.</p>
								<p class="to-animate intro-animate-3">채택된 문제는 포인트를 드립니다.</p>
								<%if(!u_id.equals("master")){ %>
								<form action="/GuiltyPleasure/borad">
									<input type="hidden" name="cmd" value="QREGI_BOARD_LIST"/>
									<input class="btn btn-success" type="submit" value="출제하러 가기">
								</form>
								<%} %>
								<%if(u_id.equals("master")){ %>
								<form action="/GuiltyPleasure/CORDING/QuizRegi/QuizReg.jsp">
									<input class="btn btn-success" type="submit" value="관리자모드  : 출제">
								</form>
								<form action="/GuiltyPleasure/borad">
									<input type="hidden" name="cmd" value="QREGI_BOARD_LIST"/>
									<input class="btn btn-success" type="submit" value="문제 출력 확인">
								<%}%>
							</div>
						</div>
					</div>						
				</div>
			</header>
</body>
</html>