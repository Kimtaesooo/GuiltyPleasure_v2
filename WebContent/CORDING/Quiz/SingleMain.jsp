<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>싱글 플레이</title>
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
#fh5co-hero .fh5co-overlay { background: #f5f5f5;}
#fh5co-hero .fh5co-intro h2 {color: #333333;}
#fh5co-hero .fh5co-intro p {color: #333333;}
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<body>
<jsp:include page="/test_nav.jsp"/>
<div>
<header id="fh5co-hero" data-section="home" role="banner" style="background: WHITE top left; background-size: cover;" >
		<div class="fh5co-intro">
			<div class="container">
				<div class="row">							
					<div class="col-md-12 fh5co-text">
						<h2 class="to-animate intro-animate-1" align="center">문제 제출 방식 선택 ! </h2>
						<br><br><br>
			<div class="col-md-6 to-animate">
					<a href="SingleStart.jsp" class="fh5co-figure">
						<span class="fh5co-price">
						<font size=6>객관식
						</font></span>
						<br>
						<img src="https://cdn2.iconfinder.com/data/icons/interface-12/24/interface-80-128.png">
					</a>
			</div>
			<div class="col-md-6 to-animate">
					<a href="ShortStart.jsp" class="fh5co-figure">
						<span class="fh5co-price">
						<font size=6>주관식
						</font></span>
						<br>
						<img src="https://cdn3.iconfinder.com/data/icons/mini-icon-set-general-office/91/General_-_Office_09-128.png">
					</a>
			</div>
					</div>
				</div>
			</div>
		</header>
</div>

</body>
</html>