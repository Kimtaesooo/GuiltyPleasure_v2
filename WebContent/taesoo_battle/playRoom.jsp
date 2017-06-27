<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="dao.playmodule.BattlePlay"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<title>게임방</title>
<script>
	window.addEventListener("onbeforeunload", closeChatRoom, false);
</script>
</head>
<body>
<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	String bangjang = request.getParameter("u_id"); // 방장의 아이디
	String gameUser = (String)session.getAttribute("u_id"); // 접속자의 아이디
	String ip = request.getRemoteAddr();
	System.out.println(ip);
	//System.out.print(clientIP + " : ");

	// 방장 만들기
	if(bangjang == null || bangjang.equals("null")){
		bangjang = gameUser;
		gameUser = "";
	}
	System.out.println("방장 : " + bangjang);
	System.out.println("플에이어 : " + gameUser);
	List roominfo = dao.roomInfo(bangjang);
	Battle_Room room = (Battle_Room)roominfo.get(0);
	if(room.getBr_people()==3){
%>
		<script> alert('인원이 꽉 찼습니다.'); 	location.href="battleRoom.jsp";	</script>
<%	}
	
%>
	<br><br>
	<input type="hidden" value="<%=ip%>" id="ip">
	<input type="hidden" value="<%=gameUser%>" id="gameUser">
	<input type="hidden" value="<%=bangjang%>" id="bangjang">
	<input type="hidden" id="uri" value="ws://localhost:8080"> 

	<p class="text-center">배틀 게임 시작</p>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="16" placeholder="퀴즈 문제 출력 되는 곳"
				readonly></textarea>
			<br><br><br>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					1번답 출력<br><br><br><br><br>F1
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					2번답 출력<br><br><br><br><br>F2
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					3번답 출력<br><br><br><br><br>F3
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					4번답 출력<br><br><br><br><br>F4
				</button>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="접속자 확인 하는 곳" id="connectionCheck" readonly></textarea>
			<br>
			<textarea class="form-control" rows="15" id="messageWindow" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
				</div>
				<div class="col-xs-3">
					<input type="button" class="btn btn-default" value="전송" onclick="send()"/>
				</div>
			<br><br><br>
				<div class="col-xs-12">
					<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp" role="button">포기하기</a>
				</div>
		</div>
	</div>

</body>
</html>