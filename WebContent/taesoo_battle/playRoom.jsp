<%@page import="dao.ts_battlemodule.BattlePlay"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Battle_Play"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="java.util.List"%>
<%@page import="java.net.Socket"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<title>게임방</title>
<script src=/GuiltyPleasure/ajax.js></script>
</head>
<body>
<jsp:useBean id="roomDto" class="dto.Battle_Room"/>
<jsp:useBean id="playDto" class="dto.Battle_Play"/>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	// 유저 : 클릭해서 br_num, u_id(방 생성자) 받아온다. 방장(생성자) : 방 만들때 br_num, u_id 직접 가져온다.
	String br_num = request.getParameter("br_num");
	String bangjang = request.getParameter("bangjang");
	String gameuser = "";
	String me = (String) session.getAttribute("u_id");
	String ip = request.getRemoteAddr();
	
	List roominfo = new ArrayList();
	List playinfo = new ArrayList();
	BattlePlay dao = new BattlePlay();
	
	roominfo = dao.roomInfo2(br_num);
	Battle_Room battleroom = (Battle_Room)roominfo.get(0);
	
	playinfo = dao.playInfo(br_num);
	Battle_Play battleplay = (Battle_Play)playinfo.get(0);
	
	String user01 = battleplay.getUser01(); // 방장
	String user02 = battleplay.getUser02(); // 게임유저
	
	if(battleroom.getBr_people()==1){
		if(!session.getAttribute("u_id").equals(bangjang)){
			gameuser = (String) session.getAttribute("u_id");
			// Br_people 인원 수 증가
			dao.updatePlayRoom(br_num, gameuser);
		}
	}
	if(battleroom.getBr_people()==2){
		if(!session.getAttribute("u_id").equals(user01) && !session.getAttribute("u_id").equals(user02)){
%>
		<script> alert('인원이 꽉 찼습니다.'); 	location.href="battleRoom.jsp";	</script>
<% 		}
	}%>
	
	<input type="hidden" value="<%=user01%>" id="user01">
	<input type="hidden" value="<%=user02%>" id="user02">
	<input type="hidden" value="<%=br_num%>" id="br_num">
	<input type="hidden" value="<%=me%>" id="me">
	<input type="hidden" value="<%=ip%>" id="ip">
	<br><br>
	<p class="text-center">배틀 게임 시작</p>
	<br><br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1" id="exam">
			<textarea class="form-control" rows="16" id="windowQuiz" style="background-color:transparent;" readonly></textarea>
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
			<textarea class="form-control" rows="4" placeholder="접속자 확인 하는 곳" id="connectionCheck" style="background-color:transparent;" readonly></textarea>
			<br>
			<textarea class="form-control" rows="15" id="messageWindow" style="background-color:transparent;" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="inputMessage" onkeyup="enterkey()">
				</div>
				<div class="col-xs-3">
					<input type="button" class="btn btn-default" value="전송" onclick="send()"/>
				</div>
			<br><br><br>
			<%if(session.getAttribute("u_id").equals("A")){%>
				<div class="col-xs-6">
					<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp" role="button">포기하기</a>
				</div>
				<div class="col-xs-6">
					<a class="btn btn-success btn-lg btn-block" role="button" onclick="gameStart();">시작</a>
				</div>
			<%}else{%>
				<div class="col-xs-12">
					<a class="btn btn-danger btn-lg btn-block" href="battleRoom.jsp" role="button">포기하기</a>
				</div>
			
			<%} %>
		</div>
	</div>
	
	
	
	
	<!-- 채팅 부분 -->
	<script>
		var textarea = document.getElementById("messageWindow");
		var connectionCheck = document.getElementById("connectionCheck");
		var ip = document.getElementById('ip').value;
		var webSocket = new WebSocket("ws://70.12.110.106:8080/GuiltyPleasure/battlesocket");
		var inputMessage = document.getElementById('inputMessage');
		var user01 = document.getElementById('user01').value;
		var user02 = document.getElementById('user02').value;
		var br_num = document.getElementById('br_num').value;
		var me = document.getElementById('me').value;

		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onOpen(event) {
			textarea.value += "연결 성공\n";
			connectionCheck.value += ip + "\n";
		}
		function onClose(session) {
			webSocket.onClose(event);
			document.myForm.submit();
		}
		function onError(event) {
			alert(event.data);
		}
		function onMessage(event) {
			var message = new String(event.data);
			var strArray = message.split(':');
			if(strArray[0]==br_num){
				textarea.value += strArray[1] + " : " + strArray[2] + "\n";
			}
		}
		
		function send() {
			if (inputMessage.value == "") {
			} else {
				textarea.value += me + " : " + inputMessage.value + "\n";
				webSocket.send(br_num + ":" + me +":"+inputMessage.value);
				inputMessage.value = "";
			}
		}

		function enterkey() {
			if (window.event.keyCode == 13) {
				send();
			}
		}
	</script>
	
	
	

</body>
</html>