<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="userdao" class="dao.UserInfoDAO"/>
<jsp:useBean id="userdto" class="dto.UserInfoDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		location.href="taesoo_battle/battleRoom.jsp";
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
<div id="fh5co-offcanvass">
	<%if(u_id.length()==0) {%>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/login.html">로그인</a></h2>
	<h2 class="fh5co-lead"><a href="/GuiltyPleasure/CORDING/login/resistration.html">회원가입</a></h2>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/idpw.jsp">아이디/비밀번호 찾기</a></h2>
	<%}else{ %>
	<h2 class="fh5co-lead"><%=u_id %>님 환영합니다</h2>
	<h2 class="fh5co-lead">포인트 : <%=userdto.getPoint() %></h2>
	<h2 class="fh5co-lead"><a href="${pageContext.request.contextPath}/CORDING/login/logout.html">로그아웃</a>
	<a href="/GuiltyPleasure/myinfo?cmd=MYINFO">마이페이지</a></h2>
	<%} %>
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/main.jsp" >메인</a></li>
			<li><a href="javascript:insingle()" data-nav-section="features">싱글플레이</a></li>
			<li><a href="javascript:inbattle()" data-nav-section="design">배틀플레이</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/rank/rankBattle.jsp"" data-nav-section="design">랭킹</a></li>
			<li><a href="javascript:inregquiz()" data-nav-section="testimonies">퀴즈출제</a></li>
			<li><a href="javascript:inshop()" data-nav-section="testimonies">상점</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/notice_board/n_list.jsp" data-nav-section="products">공지사항</a></li>
			<li><a href="CORDING/board/BoardList.jsp" data-nav-section="benefits">자유게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/CORDING/custom/customer_main.jsp" data-nav-section="pricing">고객센터</a></li>
				<%if(u_id.equals("master")) {%>
			<li><a href="/GuiltyPleasure/userinfo?cmd=LIST" data-nav-section="pricing">회원관리</a></li>
			<li><a href="/GuiltyPleasure/quizinfo?cmd=LIST" data-nav-section="pricing">퀴즈관리</a></li>
				<%} %>
		</ul>
</div>
<div id="fh5co-menu" class="navbar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#fh5co-navbar" aria-expanded="false" aria-controls="navbar"><span>Menu</span> <i></i></a>
					<a href="${pageContext.request.contextPath}/main.jsp" data-nav-section="home" class="navbar-brand"><span>Guilty Pleasure</span></a>
				</div>
			</div>
		</div>
</div>
</body>
</html>