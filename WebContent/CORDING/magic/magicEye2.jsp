<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="carousel slide" id="theCarousel">
					<!-- slide속성을 줘서 화면이 회전하게 할수있게 한다. -->
					<div class="carousel-inner">
					  	<ol class="carousel-indicators">
    					<li data-target="#theCarousel" data-slide-to="0" class="active"></li>
    					<li data-target="#theCarousel" data-slide-to="1"></li>
  	 					<li data-target="#theCarousel" data-slide-to="2"></li>
  	 					<li data-target="#theCarousel" data-slide-to="3"></li>
  	 					<li data-target="#theCarousel" data-slide-to="4"></li>
  	 					<li data-target="#theCarousel" data-slide-to="5"></li>
  	 					<li data-target="#theCarousel" data-slide-to="6"></li>
  	 					<li data-target="#theCarousel" data-slide-to="7"></li>
  	 					<li data-target="#theCarousel" data-slide-to="8"></li>
  	 					<li data-target="#theCarousel" data-slide-to="9"></li>
  	 					<li data-target="#theCarousel" data-slide-to="10"></li>
  						</ol><!-- 인디캐이터로 캐러셀안에서 원하는 위치로 옮길때 중간에 생기는 목록같은것 -->
						<!-- carousel-inner로 캐러셀에 들어갈 이미지들을 꼭 묶어줘야한다. -->
						<div class="item active">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/011magiceye3d.jpg" />
						</div>
						<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/011magiceye3d.jpg" />
						</div>
						<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/012magiceye3d.jpg" />
						</div>
						<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/013magiceye3d.jpg" />
						</div>
						<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/014magiceye3d.jpg" />
						</div>
						<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/015magiceye3d.jpg" />
						</div>
							<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/016magiceye3d.jpg" />
						</div>
							<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/017magiceye3d.jpg" />
						</div>
							<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/018magiceye3d.jpg" />
						</div>
							<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/019magiceye3d.jpg" />
						</div>
							<div class="item">
							<img class ="center-block" src="/GuiltyPleasure/CORDING/magic/img/020magiceye3d.jpg" />
						</div>
					</div><!-- inner -->
					<a href="#theCarousel" class="carousel-control left" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					</a>
					<a href="#theCarousel"  class="carousel-control right" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					</a>
					<!--carousel-control right 속성을 통해 밖에 설정된 버튼이미지를 캐러셀안으로 넣을수있다.  -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>