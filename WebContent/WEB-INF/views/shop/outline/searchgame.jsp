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
area {
	cursor: default
}
</style>

</head>
<script>
	//틀린 부분 5개 찾았는지 체크하는 변수
	var flag1 = false;
	var flag2 = false;
	var flag3 = false;
	var flag4 = false;
	var flag5 = false;
	
	//3문제중 한문제가 랜덤으로 출력되도록
	<%
	int qNumber = (int) Math.floor(Math.random() * 3)+1;
	session.setAttribute("qNumber", qNumber);
	%>
	
	//맞추지 못한 정답부분을 클릭했을때만 정답체크되도록
	function searchCheck(i) {
		<%for(int j=1; j<6;j++){%>
		if (i == <%=j%>) {
			if (flag<%=j%> == false) {
				var $x = event.pageX;
				var $y = event.pageY;
				$('#popLayer<%=j%>').css({
					"top" : $y-10,
					"left" : $x-10,
				}).show();
				flag<%=j%> = true;
			}
		}
		<%}%>
	}
	
	//완료 버튼을 눌렀을때 모든 정답을 맞췄을 경우에만 포인트 지급되도록
	function checkFlag() {
		if(flag1&&flag2&&flag3&&flag4&&flag5){
			document.getElementById('quiz').submit();
		}
		else{
			$("#moreModal").modal();
		}
	}
	
</script>
<body>
	<jsp:include page="/nav.jsp" />

	<br>
	<br>
	<br>
	<br>


	<!--5개의 체크표시가 각각 팝업으로 뜰 수 있도록 팝업창 준비-->
	<c:forEach begin="1" end="5" step="1" var="i">

		<div id="popLayer${i}" style="position: absolute; display: none;">

			<div id="contents" style="position: absolute; z-index: 500;">
				<input type="image" name="submit" value="submit"
					src="/GuiltyPleasure/CORDING/shop/img/img_o.png" width="30"
					height="30" />
			</div>

		</div>
	</c:forEach>



	<!-- 다 맞추지 못했는데 완료버튼을 눌렀을때 모달 -->
	<div class="modal fade" id="moreModal" data-backdrop="" align="center">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">

					<h3>어머나</h3>
				</div>
				<div class="modal-body">

					<p>
						좀 더 집중해보세요
						<%=session.getAttribute("u_id")%>님!<br> 틀린 부분이 더 있을거예요
					</p>
					</form>
				</div>
				<div class="modal-footer" align="center">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


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



		
		<!-- 세션에 저장된 문제 번호를 이미지주소와 이미지맵이름에 삽입하여 문제실행-->
		<div style="position: fixed; left: 200px; top: 230px;">
			<img
				src="/GuiltyPleasure/CORDING/shop/img/search<%=session.getAttribute("qNumber")%>.jpg"
				usemap="#search<%=session.getAttribute("qNumber")%>Map" />

			<map name="search1Map">
				<area shape="poly"
					coords="527,311,515,366,524,394,541,400,545,401,534,360,541,310,564,310,574,310,562,311,562,400,582,402,584,378,574,330,573,310,563,310,536,306,531,306,526,304,525,307,527,305"
					onclick="searchCheck(1)">
				<area shape="poly"
					coords="551,233,536,244,538,260,546,266,547,262,546,251,551,248,557,253,559,255,558,268,558,270,566,262,564,246,564,237,552,232,552,231"
					onclick="searchCheck(2);" />
				<area shape="poly"
					coords="744,406,714,409,714,415,716,417,743,414,743,412"
					onclick="searchCheck(3);" />
				<area shape="poly" coords="482,127,477,147,488,149,490,134,485,132"
					onclick="searchCheck(4);" />
				<area shape="rect" coords="477,33,486,46" onclick="searchCheck(5);" />
			</map>

			<map name="search2Map">
				<area shape="rect" coords="512,288,520,306" onclick="searchCheck(1)" />
				<area shape="rect" coords="630,125,641,141" onclick="searchCheck(2)" />
				<area shape="rect" coords="494,410,522,433" onclick="searchCheck(3)" />
				<area shape="poly"
					coords="695,327,750,371,738,384,677,336,682,340,680,339"
					onclick="searchCheck(4)" />
				<area shape="rect" coords="698,278,704,310" onclick="searchCheck(5)" />

			</map>
			<map name="search3Map">
				<area shape="circle" coords="611,35,21" target="_self"
					onclick="searchCheck(1)" />
				<area shape="rect" coords="683,255,702,313" target="_self"
					onclick="searchCheck(2)" />
				<area shape="rect" coords="751,140,774,183" target="_self"
					onclick="searchCheck(3)" />
				<area shape="rect" coords="705,353,722,373" target="_self"
					onclick="searchCheck(4)" />
				<area shape="poly"
					coords="549,428,493,442,467,454,461,471,480,480,489,477,499,479,528,480,498,465,497,455,560,464,557,453,513,448,529,442,560,449,537,436,583,437,583,428,543,425"
					target="_self" onclick="searchCheck(5)" />
			</map>
		</div>
		<div style="position: fixed; left: 830px; top: 730px;">

			<form action="/GuiltyPleasure/searchQuiz" method="post" id="quiz">
				<input type="hidden" name="id"
					value="<%=session.getAttribute("u_id")%>">
				<button type="button" class="btn btn-default btn-xs"
					onclick="checkFlag()">완료</button>
				<button type="button" class="btn btn-default btn-xs"
					onclick="location.href='/GuiltyPleasure/CORDING/shop/outline/searchStart.jsp'">포기</button>
			</form>
		</div>


	</div>

</body>
</html>
