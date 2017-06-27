<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

%>
<title>Main</title>
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
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br>

<div class="container" id="fh5co-main">   
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
				<div id="fh5co-faqs"  data-section="faqs">
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
								<h2 class="fh5co-lead animate-single faqs-animate-1">자주 묻는 질문을 모아놨습니다.</h2>
								<p class="fh5co-sub animate-single faqs-animate-2">클릭해서 답변을 확인해보세요 !</p>
							</div>
						</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3>Q.포인트는 어디에 사용 하나요??</h3>
							<div class="faq-body">
								<p>A.아이템을 구매하거나 배틀플레이에 사용됩니다.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3>Q.아이디를 모르겠어요.</h3>
							<div class="faq-body">
								<p>A.아이디 비밀번호 찾기를 이용하세요.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3>Q.배틀플레이 에서 계속 지면 어떻게 되나요??</h3>
							<div class="faq-body">
								<p>A.패가 늘어나고 포인트가 깍입니다.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3> Q.아이디/비밀번호 찾기를 이용해도 못찾겠습니다.</h3>
							<div class="faq-body">
								<p>A.고객센터에 적힌 연락처로 전화를 주세요.</p>
							</div>
					</div>
					<div class="faq-accordion to-animate">
							<span class="faq-accordion-icon-toggle"><i class="icon-arrow-down"></i></span>
							<h3> Q.랭킹 계산법이 어떻게 되나요??</h3>
							<div class="faq-body">
								<p>A.200판 이상한 유저들 중에 정답률이나 승률이 높은 유저를 선정합니다.</p>
							</div>
					</div>

				</div>
			</div>	
        </div>
</div>
</body>
</html>