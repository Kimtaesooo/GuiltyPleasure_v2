<%@page import="dto.UserInfo"%>
<%@page import="dao.loginmodule.Login"%>
<%@page import="dto.Battle_Room"%>
<%@page import="dto.Battle_Play"%>
<%@page import="java.util.List"%>
<%@page import="dao.battlemodule.BattlePlay"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.QuizResult"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과</title>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	String br_num = request.getParameter("br_num");
	// 게임 포기한 유저 아이디
	String loser = request.getParameter("u_id");
	String u_id = (String)session.getAttribute("u_id");

	BattlePlay battleplay = new BattlePlay();
	List playinfo = battleplay.playInfo(br_num);
	List roomInfo2 = battleplay.roomInfo2(br_num);
	Battle_Play result1 = (Battle_Play) playinfo.get(0);
	Battle_Room result2 = (Battle_Room) roomInfo2.get(0);
	String user01 = result1.getUser01();
	String user02 = result1.getUser02();
	int bp_01cnt = result1.getBp_01cnt();
	int bp_02cnt = result1.getBp_02cnt();
	int point = result2.getBr_point();

	String winner = (loser.equals(user01)) ? user02 : user01;

	battleplay.win(winner, point);
	battleplay.lose(loser, point);

	// 유저 정보 얻어 오는거임..
	UserInfo userinfo = new UserInfo();
	Login login = new Login();
	userinfo = login.getUser(u_id);
	int nowPoint = userinfo.getU_point();

	// 방 정보 삭제(새로고침 포인트 획득 방지)
	battleplay.deletPlayRoom(br_num);
%>
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
<style>
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

.fh5co-counter-label {
	font-size: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/test_nav.jsp" />
	<br>
	<br>
	<br>
	<H1 align="center">게임 결과</H1>
	<br>
	<div id="fh5co-counter" class="fh5co-bg-section"
		style="background-image: BLACK; background-attachment: fixed;">
		<div class="fh5co-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="fh5co-hero-wrap">
						<div
							class="fh5co-hero-intro text-center to-animate counter-animate">
							<div class="col-md-4 text-center">
								<span class="fh5co-counter-label"><%=loser%>님께서 게임을 포기 하셨습니다.</span> 
								<br> <span class="fh5co-counter-label">승자 : <%=winner%> </span>
							</div>
							<div class="col-md-4 text-center">
								<br>
								<%
									if (u_id.equals(winner)) {
								%>
								<span class="fh5co-counter js-counter" data-from="0"
									data-to="<%=point%>" data-speed="2000"
									data-refresh-interval="50"></span> <span
									class="fh5co-counter-label">획득 포인트 </span>
								<%
									}
								%>
								<%
									if (u_id.equals(loser)) {
								%>
								<span class="fh5co-counter js-counter" data-from="0"
									data-to="-<%=point%>" data-speed="2000"
									data-refresh-interval="50"></span> <span
									class="fh5co-counter-label">잃은 포인트 </span>
								<%
									}
								%>
							</div>
							<div class="col-md-4 text-center">
								<br> <span class="fh5co-counter js-counter" data-from="0"
									data-to="<%=nowPoint%>" data-speed="2000"
									data-refresh-interval="50"></span> <span
									class="fh5co-counter-label">현재 포인트 </span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<br>
	<div class="col-md-12">
		<div class="col-lg-8"></div>
		<div class="col-lg-4" align="right">
			<a href="/GuiltyPleasure/CORDING/battle/battleRoom.jsp"
				class="btn btn-warning">돌아가기</a>
		</div>
	</div>
</body>
</html>