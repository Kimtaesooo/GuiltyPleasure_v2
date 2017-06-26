<%@page import="java.util.List"%>
<%@page import="java.net.Socket"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="dao.playmodule.BattlePlay"%>	
<%@ page import="ts_playmodule.*"%>	
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
	String bangjang = (String)session.getAttribute("u_id"); // 접속자의 아이디
	String gameUser = "";
	List roominfo = dao.roomInfo(bangjang);
	Battle_Room room = (Battle_Room)roominfo.get(0);
	//System.out.print(ServerIP + " : ");
	Socket sock;
	// 방장 만들기
	
	/*
	// 게임룸의 리스트를 만들고 관리하며 방을 생성하고 징는 함수를 구현한다.
	RoomManager roomManger = new RoomManager();
	GameUser user = new GameUser(bangjang);
	GameRoom room = new GameRoom();
	user.EnterRoom(room);
	room.EnterRoom(user);
	roomManger.CreateRoom(user);
	*/
	System.out.println("방장 : " + bangjang);
	System.out.println("플에이어 : " + gameUser);
	if(room.getBr_people()==2){
%>
		<script> alert('인원이 꽉 찼습니다.'); 	location.href="battleRoom.jsp";	</script>
<%	}
	
%>
	<br><br>
	<input type="hidden" value="<%=room.getBr_ip()%>" id="ip">
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
	
	<script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var connectionCheck = document.getElementById("connectionCheck");
        var webSocket = new WebSocket('ws://localhost:8080/GuiltyPleasure/websocket');
        var inputMessage = document.getElementById('inputMessage');
        var ip = document.getElementById('ip').value;
        var gameUser = document.getElementById('gameUser').value;
        var bangjang = document.getElementById('bangjang').value;
        
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(bangjang, event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    
    function onMessage(event) {
        textarea.value += event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "연결 성공\n";
        connectionCheck.value += ip + "\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
    	if (inputMessage.value == ""){}
    	else{    		
        	textarea.value += "나 : " + inputMessage.value + "\n";
        	webSocket.send(bangjang+ " : " + inputMessage.value, "abcd ");
        	inputMessage.value = "";
    	}
    }
    function onClose(session) {
    	webSocket.onClose(event);
    	document.myForm.action="battleRoom.jsp";
    	document.myForm.method="post";
    	document.myForm.submit();
    }
    
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
  </script>
</body>
</html>