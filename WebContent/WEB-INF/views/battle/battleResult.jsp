<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 배틀 결과창 확인 페이지 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과</title>
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
<%@ include file="/nav.jsp" %>
<input type="hidden" id="u_id" value="${u_id}" />
<input type="hidden" id="single" value="${udto.no_single}" />
<input type="hidden" id="battle" value="${udto.no_battle}" />
	<br><br><br>
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
								<span class="fh5co-counter-label">${user01} <font color="red">vs</font> ${user02}</span> <br> 
								<span class="fh5co-counter-label">승자 : ${winner}</span>
							</div>
							<div class="col-md-4 text-center">
								<br>
								<c:if test="${u_id eq winner}">
									<span class="fh5co-counter js-counter" data-from="0" data-to="${point}" data-speed="2000" data-refresh-interval="50"></span>
									<span class="fh5co-counter-label">획득 포인트 </span>
								</c:if>
								<c:if test="${u_id eq loser}">
									<span class="fh5co-counter js-counter" data-from="0" data-to="-${point}" data-speed="2000" data-refresh-interval="50"></span>
									<span class="fh5co-counter-label">잃은 포인트 </span>
								</c:if>
							</div>
							<div class="col-md-4 text-center">
								<br> <span class="fh5co-counter js-counter" data-from="0" data-to="${nowPoint}" data-speed="2000" data-refresh-interval="50"></span>
								<span class="fh5co-counter-label">현재 포인트 </span>
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
			<a href="/GuiltyPleasure/battle?cmd=BATTLEPAGE"
				class="btn btn-warning">돌아가기</a>
		</div>
	</div>
</body>
</html>