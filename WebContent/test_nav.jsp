<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="userdao" class="dao.UserInfoDAO"/>
<jsp:useBean id="userdto" class="dto.UserInfoDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
#fh5co-menu {
    margin-top: 0px;
}
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
body {
  
  font-size: 13px;
  line-height: 15px;
 
}
a:hover, a:active, a:focus {
  color: lightgray;
  outline: none;
}
#fh5co-offcanvass ul li a:hover, #fh5co-offcanvass ul li a:focus, #fh5co-offcanvass ul li a:active {
  outline: none;
  text-decoration: none;
  color: lightgray;
}
#fh5co-offcanvass ul li.active a {
  color: lightgray !important;
}

#fh5co-menu {
    margin-top: 10px;
}
.navbar-brand {
color: #333;
    float: left;
    padding: 10px 20px;
    font-size: 18px;
    line-height: 20px;
    height: 60px;
}

#fh5co-offcanvass .fh5co-lead {
	font-size: 15px;
	color: #333;
}



.navbar-brand>span {
	border: 2px solid #333;
}

.navbar-brand:hover {
	color: #4fd2c2;
}

#fh5co-offcanvass {
    background: #ffffff;
    color: #989898;
    border-left: solid 1px #bdbdbd;
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

#fh5co-offcanvass ul li a {
   
    border-bottom: none;
   
}

</style>
<script>
$(document).ready(function(){
	function insingle(){
		if($("#u_id").val().length ==0){
			alert('로그인 후 사용 가능합니다.');
			return ;
		}
		if($("#single").val()!= 'null'){
			alert("싱글 플레이가 금지된 유저 입니다.");
			return ;
		}
		location.href="CORDING/Quiz/SingleStart.jsp";
	}
	
	function inbattle(){
		if($("#u_id").val().length ==0){
			alert('로그인 후 사용 가능합니다.');
			return ;
		}
		if($("#battle").val()!= 'null'){
			alert('배틀 플레이가 금지된 유저입니다.');
			return ;
		}
		location.href="CORDING/battle/battleRoom.jsp";
	}
	
	function inshop(){
		if($("#u_id").val().length ==0){
			alert('로그인 후 사용 가능합니다.');
			return ;
		}
		location.href="/GuiltyPleasure/shop?cmd=SHOPLIST";
	}
	
	function inregquiz(){
		if($("#u_id").val().length ==0){
			alert('로그인 후 사용 가능합니다.');
			return ;
		}
		location.href="CORDING/QuizRegi/QuizRegInfo.jsp";
	}
});
</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String u_id ="";
	if(session.getAttribute("u_id")!=null){
		u_id = (String)session.getAttribute("u_id");
	}
	
	userdto = userdao.searchUserInfo(u_id);
%>
<title>Insert title here</title>

</head>
<body>
<input type="hidden" id="u_id" value="<%=u_id %>" />
<input type="hidden" id="single" value="<%=userdto.getNo_single() %>" />
<input type="hidden" id="battle" value="<%=userdto.getNo_battle() %>" />
<div id="fh5co-offcanvass" style="padding-top: 0px;">
<div class="row" align="center">
				<div class="col-md-12">
	<%if(u_id.length()==0) {%>
	<br><br>
	<hr>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/login.html">로그인</a></h2>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/idpw.jsp">아이디/비밀번호 찾기</a></h2>
	<hr>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/GuiltyPleasure/CORDING/login/resistration.html">회원가입</a>
	<%}else{ %>
	<br><br>
	<hr>
	<h2 class="fh5co-lead"><%=u_id %>님 환영합니다!</h2>
	<h2 class="fh5co-lead">포인트 : <%=userdto.getPoint() %></h2>
	<hr>
	<a href="/GuiltyPleasure/myinfo?cmd=MYINFO">MY PAGE</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/CORDING/login/logout.html">LOGOUT</a>
	<%} %>
	</div>
	</div>
	<br><br>
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/main.jsp" >MAIN</a></li>
			<li><a href="javascript:insingle()">싱글플레이</a></li>
			<li><a href="javascript:inbattle()">배틀플레이</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/rank/rankBattle.jsp">랭킹</a></li>
			<li><a href="javascript:inregquiz()">퀴즈출제</a></li>
			<li><a href="javascript:inshop()">상점</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/notice_board/n_list.jsp">공지사항</a></li>
			<li><a href="/GuiltyPleasure/Board?cmd=BOARDLIST">자유게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/custom/customer_main.jsp">고객센터</a></li>
				<%if(u_id.equals("master")) {%>
			<li><a href="/GuiltyPleasure/userinfo?cmd=LIST">회원관리</a></li>
				<%} %>
		</ul>
</div>
<div id="fh5co-menu" class="navbar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#fh5co-navbar" aria-expanded="false" aria-controls="navbar"><span>Menu</span> <i></i></a>
					<a href="${pageContext.request.contextPath}/main.jsp" class="navbar-brand"><span>Guilty Pleasure</span></a>
				</div>
			</div>
		</div>
</div>
</body>
</html>