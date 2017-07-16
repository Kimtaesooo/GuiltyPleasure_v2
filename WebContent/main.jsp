<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
</head>


<body>
<%@ include file="/nav.jsp" %>
<input type="hidden" id="u_id" value="${u_id}" />
<input type="hidden" id="single" value="${udto.no_single}" />
<input type="hidden" id="battle" value="${udto.no_battle}" />
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
	font-size: 15px;
}
</style>
	<div id="fh5co-main">

		<header id="fh5co-hero" data-section="home"
			style="background: url(/GuiltyPleasure/src/paint.jpg) top left; background-size: cover;">



			<div class="row">
				<div class="fh5co-intro">
					<div class="container">
						<div class="fh5co-text">
							<br><br><br><br><br><br><br><br><br><br><br><br>
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
				<br> <br>

				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-left">
					<div class="row">
						<div class="col-md-3 to-animate">

							<a href="javascript:insingle()" class="fh5co-figure"> <br>
							<br> <img src="/GuiltyPleasure/src/singleimg.png"><br>
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
				<br> <br>

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

							<a href="javascript:inbattle()" class="fh5co-figure"> <br>
							<br> <img src="/GuiltyPleasure/src/battleimg.png"><br>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="animated" style="border-top: solid 1px gray;">
			<div class="row">
				<br> <br>

				<div
					class="col-md-8 col-md-offset-2 fh5co-section-heading text-left">
					<div class="row">
						<div class="col-md-3 to-animate">

							<a href="CORDING/jaum/play_jaum.jsp" class="fh5co-figure"> <br>
							<br> <img src="/GuiltyPleasure/src/gndl.gif"><br>
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
				<br> <br>

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

							<a href="CORDING/shop/outline/searchStart.jsp"
								class="fh5co-figure"> <br>
							<br> <img src="/GuiltyPleasure/src/find.png"><br>
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
					<a href="index.html"><br> <br>
					<br><br><br><br><br>
					<br><br>Guilty Pleasure</a>
					<p class="fh5co-copyright">
						<small>&copy; 2017. All Rights Reserved.</small>
					</p>
					<p class="fh5co-social-icons">
						<a href="#"><i class="icon-twitter"></i></a> <a href="#"><i
							class="icon-facebook"></i></a> <a href="#"><i
							class="icon-instagram"></i></a> <a href="#"><i
							class="icon-dribbble"></i></a> <a href="#"><i
							class="icon-youtube"></i></a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>