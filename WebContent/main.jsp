<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="userdao" class="dao.UserInfoDAO" />
<jsp:useBean id="userdto" class="dto.UserInfoDTO" />
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

	String u_id = "";

	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");

	}
	userdto = userdao.searchUserInfo(u_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
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

<script>
	$(document).ready(function() {
		$("#btnPopup").click(function() {
			$("#theModal").modal();
		});

	});
	function insingle() {
		if ($("#u_id").val().length == 0) {
			alert('로그인 후 사용 가능합니다.');
			return;
		}
		if ($("#single").val() != 'null') {
			alert("싱글 플레이가 금지된 유저 입니다.");
			return;
		}
		location.href = "CORDING/Quiz/SingleStart.jsp";
	}

	function inbattle() {
		if ($("#u_id").val().length == 0) {
			alert('로그인 후 사용 가능합니다.');
			return;
		}
		if ($("#battle").val() != 'null') {
			alert('배틀 플레이가 금지된 유저입니다.');
			return;
		}
		location.href = "taesoo_battle/battleRoom.jsp";
	}

	function inshop() {
		if ($("#u_id").val().length == 0) {
			alert('로그인 후 사용 가능합니다.');
			return;
		}
		location.href = "/GuiltyPleasure/shop?cmd=SHOPLIST";
	}

	function inregquiz() {
		if ($("#u_id").val().length == 0) {
			alert('로그인 후 사용 가능합니다.');
			return;
		}
		location.href = "CORDING/QuizRegi/QuizRegInfo.jsp";
	}
</script>

<title>Main</title>

</head>
<body>
	<jsp:include page="/test_nav.jsp" />

	<style>
#fh5co-hero {
	padding-top: 2em;
	padding-bottom: 2em;
	background: white;
}

.navbar-brand {
	color: white;
	float: left;
	padding: 10px 20px;
	font-size: 18px;
	line-height: 20px;
	height: 60px;
}

.fh5co-nav-toggle>span {
	color: white;
}

.fh5co-nav-toggle.active i::before, .fh5co-nav-toggle.active i::after {
	background: white;
}

.fh5co-nav-toggle i {
	background: white;
}

.fh5co-nav-toggle i::before, .fh5co-nav-toggle i::after {
	background: white;
}

.navbar-brand>span {
	border: 2px solid white;
}

.navbar-brand:hover {
	color: #4fd2c2;
}

.fh5co-section-heading .fh5co-lead {
	font-size: 20px;
}
.fh5co-section-heading .fh5co-sub {
	font-size:15px;
}
</style>
	<input type="hidden" id="u_id" value="<%=u_id%>" />
	<input type="hidden" id="single" value="<%=userdto.getNo_single()%>" />
	<input type="hidden" id="battle" value="<%=userdto.getNo_battle()%>" />
	<div id="fh5co-main">

		<header id="fh5co-hero" data-section="home"
			style="background: url(/GuiltyPleasure/src/paint.jpg) top left; background-size: cover;">



			<div class="row">
				<div class="fh5co-intro">
					<div class="container">
						<div class="fh5co-text">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<div class="col-md-8 col-md-offset-2 text-left">
								<hr width="60" size="5" align="left"
									style="border-top: 4px solid white;">
								<h2 class="to-animate intro-animate-1">Guilty Pleasure</h2>
								<br>
								<h4
									class="fh5co-sub to-animate animate-single intro-animate-2 fadeIn animated text-left">
									<font color="white" style="font-weight: 400;">:죄책감을 느끼거나
										하면 안된다는것을 알지만<br> <br> 자신에게 만족감을 가져다주는 것 또는 그러한 행위
									</font>
								</h4>


							</div>
						</div>
					</div>


				</div>

			</div>
		</header>



		<div class="animated"
			style="background: black; color: white; padding-bottom: 0px; font-weight: lighter;">

			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-center"
					style="margin-bottom: 0px;">

					<p class="fh5co-sub to-animate fadeIn animated">
						<br>우리에게 주어진 가장 소중한 시간! 시간을 버리며 무의미한 즐거움을 느껴봅시다
				</div>
			</div>


		</div>
		<div class="animated" style="border-top: solid 1px gray;">
			<div class="row">
			<br>
				<br>

				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-left">
					<div class="row">
						<div class="col-md-3 to-animate">
						
							<a href="javascript:insingle()" class="fh5co-figure"> <br><br>
								<img src="/GuiltyPleasure/src/singleimg.png"><br>
							</a>
						</div>

						<div class="col-md-9">
							<h2 class="fh5co-lead to-animate fadeIn animated">| 싱글 플레이</h2>
							<p class="fh5co-sub to-animate fadeIn animated">
								엄선된 퀴즈를 풀며<br> 당신의 아재력과 아싸력을 테스트해보세요!
							</p>
						</div>
					</div>
				</div>
			</div>
	</div>
		<div class="animated" style="border-top: solid 1px gray;">
			<div class="row">
			<br>
				<br>

				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-right">
					<div class="row">

						<div class="col-md-9">
							<h2 class="fh5co-lead to-animate fadeIn animated">배틀 플레이 |</h2>
							<p class="fh5co-sub to-animate fadeIn animated">
								인터넷에서조차 혼자면 너무 슬프겠죠...<br> 이젠 모니터 친구들과 함께하세요!
							</p>
						</div>
						<div class="col-md-3 to-animate">
						
							<a href="javascript:inbattle()" class="fh5co-figure"> <br><br>
								<img src="/GuiltyPleasure/src/battleimg.png"><br>
							</a>
						</div>
					</div>
				</div>
			</div>
	</div>
	
	
	<div class="animated" style="border-top: solid 1px gray;">
			<div class="row">
			<br>
				<br>

				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-left">
					<div class="row">
						<div class="col-md-3 to-animate">
						
							<a href="CORDING/jaum/play_jaum.jsp" class="fh5co-figure"> <br><br>
								<img src="/GuiltyPleasure/src/gndl.gif"><br>
							</a>
						</div>

						<div class="col-md-9">
							<h2 class="fh5co-lead to-animate fadeIn animated">| 자음 퀴즈</h2>
							<p class="fh5co-sub to-animate fadeIn animated">
								지루한 시간을 보내기에 딱!<br> 영화,애니 다양한 분야의 오덕력을 자랑해보세요.
							</p>
						</div>
					</div>
				</div>
			</div>
	</div>
	
		<div class="animated" style="border-top: solid 1px gray;">
			<div class="row">
			<br>
				<br>

				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-right">
					<div class="row">

						<div class="col-md-9">
							<h2 class="fh5co-lead to-animate fadeIn animated">틀린 그림 찾기 |</h2>
							<p class="fh5co-sub to-animate fadeIn animated">
								방구석에서 떠나는 세계여행!<br> 나빼고 모두가 다녀온 관광 명소의 틀린 부분을 찾아봅시다.
							</p>
						</div>
						<div class="col-md-3 to-animate">
						
							<a href="CORDING/shop/outline/searchStart.jsp" class="fh5co-figure"> <br><br>
								<img src="/GuiltyPleasure/src/find.png"><br>
							</a>
						</div>
					</div>
				</div>
			</div>
	</div>
	


	<div class="animated" style="border-top: solid 1px gray;">
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
				<a href="index.html"><br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>Guilty Pleasure</a>
				<p class="fh5co-copyright">
					<small>&copy; 2017. All Rights Reserved.</small>
				</p>
				<p class="fh5co-social-icons">
					<a href="#"><i class="icon-twitter"></i></a> <a href="#"><i
						class="icon-facebook"></i></a> <a href="#"><i
						class="icon-instagram"></i></a> <a href="#"><i
						class="icon-dribbble"></i></a> <a href="#"><i class="icon-youtube"></i></a>
				</p>
			</div>
		</div>
	</div>




	<!-- 


		<br><br><br><br><br><br><br>
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">

				<div class="col-md-3 to-animate">
					<a href="javascript:insingle()" class="fh5co-figure">
						<br> <img
						src="/GuiltyPleasure/src/single.png"><br>
					 <span>싱글플레이</span>
					</a>
				</div>
				<div class="col-md-3 to-animate">
					<a href="javascript:inbattle()" class="fh5co-figure"> <span>배틀플레이</span>
						<br> <img
						src="/GuiltyPleasure/src/battle.png">
					</a>
				</div>
				<div class="col-md-3 to-animate">
					<a href="javascript:inshop()" class="fh5co-figure"> <span>상점</span>
						<br> <img
						src="/GuiltyPleasure/src/item.png">
					</a>
				</div>
				<div class="col-md-3 to-animate">
					<a href="CORDING/custom/customer_main.jsp" class="fh5co-figure">
						<span">고객센터</span> <br> <img
						src="/GuiltyPleasure/src/customerlove.png">
					</a>
				</div>
			</div>
		</div>

		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
				<div class="col-md-3 to-animate">
					<a href="CORDING/rank/rankBattle.jsp" class="fh5co-figure"> <span
						class="fh5co-price">랭킹</span> <br> <img
						src="/GuiltyPleasure/src/rank.png">
					</a>
				</div>
				<div class="col-md-3 to-animate">
					<a href="/GuiltyPleasure/notice?cmd=list" class="fh5co-figure">
						<span class="fh5co-price">공지사항</span> <br> <img
						src="/GuiltyPleasure/src/notice.png">
					</a>
				</div>

				<div class="col-md-3 to-animate">
					<a href="/GuiltyPleasure/Board?cmd=BOARDLIST" class="fh5co-figure">
						<span class="fh5co-price">자유게시판</span> <br> <img
						src="/GuiltyPleasure/src/board.png">
					</a>
				</div>
				<div class="col-md-3 to-animate">
					<a href="javascript:inregquiz()" class="fh5co-figure"> <span
						class="fh5co-price">퀴즈등록</span> <br> <img
						src="/GuiltyPleasure/src/regquiz.png">
					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
				<div class="col-md-3 to-animate">
					<a href="CORDING/jaum/play_jaum.jsp" class="fh5co-figure"
						data-toggle="modal"> <span class="fh5co-price">자음퀴즈</span> <br>
						<img
						src="/GuiltyPleasure/src/iniQuiz.png">
					</a>
				</div>
				<div class="col-md-3 to-animate">
					<a href="CORDING/shop/outline/searchStart.jsp" class="fh5co-figure"
						data-toggle="modal"> <span class="fh5co-price">틀린그림찾기</span> <br>
						<img
						src="/GuiltyPleasure/src/spotD.png">
					</a>
				</div>
			</div>
		</div>
		</div>
		<!--<jsp:include page="/chaticon3.jsp"/>
        <hr>


        <footer>
            <div class="row">
                <div class="col-md-12">
                    <p>Copyright &copy; Guilty Pleasure</p>
                </div>
            </div>

        </footer>

    </div>
    
 <div class="modal fade" id="theModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>생각없는 퀴즈사이트 입니다.</h3>
							</div>
							<div class="modal-body">
								<p>문제를 공유하고 남들이 출제한 문제를 풀어</p>
								<p>랭킹에 도전하세요</p>
							</div>
							<div class="modal-footer">
							<button class="btn btn-primary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
 </div><!-- 모달 -->
</div>
</body>
</html>