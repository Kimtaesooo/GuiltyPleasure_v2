<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<p class="text-center">배틀 게임 시작</p>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<textarea class="form-control" rows="16" placeholder="퀴즈 문제 출력 되는 곳"
				readonly></textarea>
			<br>
			<br>
			<br>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					1번답 출력<br><br><br>F1
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					2번답 출력<br><br><br>F2
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					3번답 출력<br><br><br>F3
				</button>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-success btn-lg btn-block">
					4번답 출력<br><br><br>F4
				</button>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="접속자 확인 하는 곳"
				readonly></textarea>
			<br>
			<fieldset>
			<textarea class="form-control" rows="15" id="messageTextArea" readonly></textarea>
			<br>
				<div class="col-xs-9">
					<input type="text" class="form-control" id="textMessage">
				</div>
				<div class="col-xs-3">
					<input type="button" value="전송" onclick="sendMessage()"/>
				</div>
			</fieldset>
		</div>
	</div>
	
	<script type="text/javascript">
        //WebSocketEx는 프로젝트 이름
        //websocket 클래스 이름
        var webSocket = new WebSocket("ws://70.12.110.106:8080/GuiltyPleasure/bbb");
        var messageTextArea = document.getElementById("messageTextArea");
        //웹 소켓이 연결되었을 때 호출되는 이벤트
        webSocket.onopen = function(message){
            messageTextArea.value += "Server connect...\n";
        };
        //웹 소켓이 닫혔을 때 호출되는 이벤트
        webSocket.onclose = function(message){
            messageTextArea.value += "Server Disconnect...\n";
        };
        //웹 소켓이 에러가 났을 때 호출되는 이벤트
        webSocket.onerror = function(message){
            messageTextArea.value += "error...\n";
        };
        //웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
        webSocket.onmessage = function(message){
            messageTextArea.value += "Recieve From Server => "+message.data+"\n";
        };
        //Send 버튼을 누르면 실행되는 함수
        function sendMessage(){
            var message = document.getElementById("textMessage");
            messageTextArea.value += "Send to Server => "+message.value+"\n";
            //웹소켓으로 textMessage객체의 값을 보낸다.
            webSocket.send(message.value);
            //textMessage객체의 값 초기화
            message.value = "";
        }
        //웹소켓 종료
        function disconnect(){
            webSocket.close();
        }
    </script>

</body>
</html>