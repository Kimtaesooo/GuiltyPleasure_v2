<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매직아이</title>

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
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<div>
		<header id="fh5co-hero" data-section="home" role="banner" style="background: WHITE top left; background-size: cover;">
			<div class="fh5co-intro">
				<div class="container">
					<div class="row">
						<div class="col-md-6 fh5co-text">
							<h2 class="to-animate intro-animate-1">매직아이 게임입니다.</h2>
							<p class="to-animate intro-animate-2">장시간 이용은 눈에 않좋으니 짧게 이용해주세요</p>
							<form action="/GuiltyPleasure/CORDING/magic/magicEyePlay.jsp">
								<input type="submit" value="시작하기" style="color: #333;"> 
								<input type="button"value="메인으로 가기" style="color: #333;" onclick="location.href='/GuiltyPleasure/main.jsp'">
							</form>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
</body>
</html>