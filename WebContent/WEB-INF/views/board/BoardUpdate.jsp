<%@page import="dto.Board"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 글 수정</title>
<script>
	var form;
	function check() {
		form = document.updateform;
		if (!form.b_title.value) {
			alert("제목을 적어주세요");
			form.b_title.focus();
			return;
		}

		if (!form.b_content.value) {
			alert("내용을 적어주세요");
			form.b_content.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/nav.jsp" />
	<br><br><br><br><br><br>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<%
	String b_num = request.getParameter("b_num");
	dto = dao.getBoard(b_num, false);

	String sid = (String) session.getAttribute("u_id");
%>
	<div class="row">
	<div style="padding-top:0px; height:90px; background-color: #4fd2c2">
		<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
			<h2 class="fh5co-lead animate-single product-animate-1 fadeIn animated">수정</h2>
		</div>
	</div>
</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align=center>
			<form name="updateform" method="post" action="/GuiltyPleasure/Board">
				<input type="hidden" name="cmd" value="BOARDUPDATEPROC"/>
				<input type="hidden" name="b_num" value="<%=b_num%>" />
				<table class="table table-condensed">
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">제 목 &nbsp;&nbsp;</td>
						<td><input class="form-control" name="b_title" size="50"
							maxlength="100" value="<%=dto.getB_title()%>"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">작성자 &nbsp;&nbsp;</td>
						<td><input class="form-control" name="id" size="50"
							maxlength="50" value="<%=sid%>" readonly="readonly"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">내 용 &nbsp;&nbsp;</td>
						<td><textarea name="b_content" class="form-control" rows="13"
								cols="50"><%=dto.getB_content()%></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4"></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2"><br>
							<button type="button" class="btn btn-primary" onclick="check()">수정</button>
							<button type="button" class="btn btn-default"
								onclick="javascript:history.back(-1)">취소</button>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>