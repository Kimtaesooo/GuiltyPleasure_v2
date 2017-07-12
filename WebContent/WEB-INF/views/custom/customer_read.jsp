<%@page import="dto.c_board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:useBean id="dao" class="dao.customermodule.customer"/>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String sc_num = request.getParameter("sc_num");
	c_board dto = new c_board();
	dto = dao.getRead(sc_num);
	String answer = dao.getReadAs(sc_num);
	String id="";
	if(session.getAttribute("u_id")!=null){
		id = (String)session.getAttribute("u_id");
	}
%>


<title>글 쓰기</title>
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
<script>
function check(){
	if(document.ans.sca_answer.value == ""){
		alert("내용을 입력해주세요.");
		document.ans.answer.focus();
		return;
	}
	document.ans.submit();
}
function delete1(){
	if(document.del.pwcheck.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.del.pw.focus();
		return;
	}
	document.del.submit();
}
function deleteChk(){
	$(".pw").show(1000);
	$("#submit").show(1000);
	$("#cancel").show(1000);
}
function deleteNo(){
	$(".pw").hide(1000);
	$("#submit").hide(1000);
	$("#cancel").hide(1000);
}
$(document).ready(function(){
	$(".pw").hide(0);
	$("#submit").hide(0);
	$("#cancel").hide(0);
});
</script>
</head>
<body>
<jsp:include page="/nav.jsp"/>
<br><br><br><br><br>

<div class="container" id="fh5co-main">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success ">문의</a>
        	<a href="#" class="btn btn-info active">문의 내역</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >문의하기</a>	
			</div>
			<br><br><br>
			<div class="jumbotron">
			<H2><span class="glyphicon glyphicon-user"></span>문의내용</H2>
			<pre>글제목 : <%=dto.getSc_title() %></pre>
			<pre>등록일 : <%=dto.getSc_regdate() %></pre>
			<pre>처리상태 : <%=dto.getSc_state() %> </pre>
			<pre><%=dto.getSc_content() %>
			
			
			
			</pre>
			
			<H2><span class="glyphicon glyphicon-arrow-right"></span>답변</H2>
			<%if(answer==null){ %>
			
				<%if(id.equals("master")){%>
				<form action="customer_ans_proc.jsp" method="post" name="ans">
				<input type="hidden" value="<%=dto.getSc_num()%>" name="sc_num">
				<textarea class="form-control" rows="10" id="content" name="sca_answer"></textarea>
				<br>
		        <a href="javascript:check()" class="btn btn-primary">답변하기</a>
				</form>
				<%}else{ %>
				<h2>아직 처리하지 않은 문의내용 입니다..</h2>
				<%} %>
				<br>
			<%}else{ %>
			<pre><%=answer %>
			</pre>
			<%} %>
			<%if(id.equals("master")==false){ %>
			<form action="customer_delete_proc.jsp" method="post" name="del">
					<input type="hidden" value="<%=dto.getSc_num()%>" name="sc_num">
					<input type="hidden" value="<%=dto.getU_id()%>" name="u_id">
		        	<a class="btn btn-primary" href="javascript:deleteChk()">삭제하기</a>
		        	<input type="password" size="20" name="pwcheck" placeholder="비밀번호를 입력하세요" class="pw">
		        	<a href="javascript:delete1()" class="btn btn-danger" id="submit">확인</a>
		        	<a class="btn btn-success" id="cancel" href="javascript:deleteNo()">취소</a>
			</form>
			<BR>
			<%} %>
			<a href="customer_list.jsp" class="btn btn-primary ">목록으로</a>
			</div>
	</div>
</div>
</body>

</html>
