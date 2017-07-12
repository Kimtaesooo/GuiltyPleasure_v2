<%@page import="dto.UserInfoDTO"%>
<%@page import="dto.UserInfo"%>
<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cnt" value="0" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Outline &mdash; A Free HTML5 Responsive Template by
	FREEHTML5.CO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Webfonts -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>



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



<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/GuiltyPleasure/design/mintstrap/outline/js/respond.min.js"></script>
	<![endif]-->


<style>
.fh5co-feature, .fh5co-figure {
	display: block;
	color: #444;
	float: left;
	width: 100%;
	text-align: center;
	background: #fff;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	border-radius: 4px;
	padding: 0px 0px;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
	margin-bottom: 0em;
}

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

.fh5co-nav-toggle.active i::before, .fh5co-nav-toggle.active i::after {
	background: #333;
}

.fh5co-nav-toggle i {
	background: #333;
}

.fh5co-nav-toggle i::before, .fh5co-nav-toggle i::after {
	background: #333;
}
</style>

</head>

<body>
	<jsp:include page="/nav.jsp" />

	<br>
	<br>
	<br>
	<br>



	<div id="fh5co-main">
		<div class="row">
			<div
				style="padding-top: 0px; height: 60px; background-color: #4fd2c2">
				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
					<h2>Spot the difference!</h2>
				</div>

			</div>
		</div>


		<div>
			<header id="fh5co-hero" data-section="home"
				style="background: WHITE top left; background-size: cover;">
				<div class="fh5co-intro">
					<div class="container">

						<div class="fh5co-text">
							<font color="black">
								<h2 class="to-animate intro-animate-1">
									<font color="black">귀한 시간과 귀한 눈 함께 날려버리기 </font>
								</h2>
								<p class="to-animate intro-animate-2">틀린부분 5개를 찾자!</p>
							</font>
							<form method="post"
								action="/GuiltyPleasure/CORDING/shop/outline/searchgame.jsp">
								<p class="to-animate intro-animate-3">

									<button type="submit" class="btn btn-default btn-xs">시작!</button>
								</p>
							</form>
						</div>

					</div>
				</div>
			</header>
		</div>
	</div>
</body>
</html>
