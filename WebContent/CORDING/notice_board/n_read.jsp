<%@page import="dao.customermodule.customer"%>
<%@page import="dto.Notice"%>
<%@page import="dao.noticemodule.notice"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:useBean id="dao" class="dao.noticemodule.notice"/>

<%
	
	Notice dto = new Notice();
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String num = request.getParameter("num");
	dao.N_Count_Update(num);
	dto = dao.getRead(num);
%>

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
<div class="container">   
        <div class="row col-lg-12">
		
			<div class="col-lg-12 panel panel-success">
				<br>
				<br>
				<div class="jumbotron">
						<div class="jumbotron">
						<H2>공지사항</H2>
						<pre>글제목 : <%=dto.getN_title() %></pre>
						<pre>등록일 : <%=dto.getN_regdate() %></pre>
						<pre>작성자 : <%=dto.getU_nickname() %> </pre>
						<pre><%=dto.getN_content() %></pre>
						<a href="n_list.jsp" class="btn btn-success">목록으로</a>
						<%if(session.getAttribute("u_id")!=null&&session.getAttribute("u_id").equals("master")){ %>
						<a href="n_delete.jsp?n_num=<%=num%>" class="btn btn-danger">삭제하기</a>
						<%} %>
		        </div>
			</div>
			
        </div>
	</div>
</div>
</body>
</html>