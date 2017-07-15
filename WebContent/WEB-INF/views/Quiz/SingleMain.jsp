<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>싱글 플레이</title>

</head>
<body>
<jsp:include page="/nav.jsp"/>
<input type="hidden" id="u_id" value="${u_id}" />
<input type="hidden" id="single" value="${udto.no_single}" />
<input type="hidden" id="battle" value="${udto.no_battle}" />
<div>
<header id="fh5co-hero" data-section="home" role="banner" style="background: WHITE top left; background-size: cover;" >
		<div class="fh5co-intro">
			<div class="container">
				<div class="row">							
					<div class="col-md-12 fh5co-text">
						<h2 class="to-animate intro-animate-1" align="center"><font color="black">문제 제출 방식 선택 !</font> </h2>
						<br><br><br>
			<div class="col-md-6 to-animate">
					<a href="SingleStart.jsp" class="fh5co-figure">
						<span class="fh5co-price">
						<font size=3>객관식
						</font></span>
						<br>
						<img src="https://cdn2.iconfinder.com/data/icons/interface-12/24/interface-80-128.png">
					</a>
			</div>
			<div class="col-md-6 to-animate">
					<a href="ShortStart.jsp" class="fh5co-figure">
						<span class="fh5co-price">
						<font size=3>주관식
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