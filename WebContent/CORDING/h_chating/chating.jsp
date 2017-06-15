<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://1270.0.1:8080/GuiltyPleasure/websocket");
		var messageTextArea = document.getElementById("messageTextArea");
		
		//웹소켓이 연결되었을 때 호출되는 이벤트
		webSocket.onopen = function(message) {
			messageTextArea.value += "서버 접속";
		};
		
		webSocket.onclose = function(message) {
			messageTextArea.value += "서버 해제";
		};
		
		webSocket.onerror = function(message){
			messageTextArea.value += "에러 발생";
		};
		
		//웹 소켓에서 메시지가 날라왔을때 호출되는 이벤트
		webSocket.onmessage = function(message){
			messageTextArea.value += "서버로부터 받은 메세지" + message.data +"\n";
		};
		
		function sendMessage(){
			var message = document.getElementById("textMessag");
			messageTextArea.value += "서버로 메시지 보내기" + message.value +"\n";
			webSocket.send(message.value);
			//textMessage 객체의 값 초기화;
			message.value="";
		}
		
		function disconnect(){
			webSocket.close();
		}
	</script>
	<form>
		<input id="textMessage" type="text" />
		<input type="button" onclick="sendMessage()" value="보내기"/>
		<input type="button" onclick="disconnect()" value="나가기"/>
	</form>
	<br/>
	
	<textarea id= "messageTextArea"rows="10" cols="50"></textarea>
</body>
</html>