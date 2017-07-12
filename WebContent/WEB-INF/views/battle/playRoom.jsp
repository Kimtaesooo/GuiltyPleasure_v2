<%@ page import="dao.battlemodule.BattlePlay"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Battle_Play"%>
<%@ page import="dto.Battle_Room"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.Socket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 

	유저가 플레이하는 배틀 게임 플레이방

 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 유저 : 클릭해서 br_num, u_id(방 생성자) 받아온다. 방장(생성자) : 방 만들때 br_num, u_id 직접 가져온다.
		String br_num = request.getParameter("br_num");
		String bangjang = request.getParameter("bangjang");
		String gameuser = "";
		String me = (String) session.getAttribute("u_id"); // 내 아이디 세션값으로 저장(웹소켓에 보낼때 쓴다.)
		String q_type = request.getParameter("br_type");
		String ip = request.getRemoteAddr();

		// dto, dao 선언
		List roominfo = new ArrayList();
		List playinfo = new ArrayList();
		BattlePlay dao = new BattlePlay();

		roominfo = dao.roomInfo2(br_num); // 방에 대한 정보(battleroom) - 문제개수, 유형 등등
		Battle_Room battleroom = (Battle_Room) roominfo.get(0);

		playinfo = dao.playInfo(br_num); // 방에 속한 유저들의 정보(playroom) - 방장ID, 유저ID, 정답 카운팅 등
		Battle_Play battleplay = (Battle_Play) playinfo.get(0);

		String user01 = battleplay.getUser01(); // 방장
		String user02 = battleplay.getUser02(); // 게임유저
		int people = battleroom.getBr_people();

		if (battleroom.getBr_people() == 1) {
			if (!session.getAttribute("u_id").equals(bangjang)) {
				gameuser = (String) session.getAttribute("u_id");
				// Br_people 인원 수 증가
				dao.updatePlayRoom(br_num, gameuser);
			}
		}
		if (battleroom.getBr_people() == 2) {
			if (!session.getAttribute("u_id").equals(user01) && !session.getAttribute("u_id").equals(user02)) {
	%>
	<script>
		alert('인원이 꽉 찼습니다.');
		location.href = "battleRoom.jsp";
	</script>
	<%
		}
		}
	%>



	<input type="hidden" value="<%=user01%>" id="user01">
	<input type="hidden" value="<%=user02%>" id="user02">
	<input type="hidden" value="<%=br_num%>" id="br_num">
	<input type="hidden" value="<%=q_type%>" id="q_type">
	<input type="hidden" value="<%=me%>" id="me">
	<input type="hidden" value="<%=ip%>" id="ip">
	<input type="hidden" value="<%=people%>" id="people">
	<br>
	<br>
	<h3 align=center>배틀 게임 시작</h3>
	<br>
	<br>
	<div class="row">
		<div class="col-md-7 col-md-offset-1" id="exam">
			<div class="col-md-10" id="windowQuiz"
			style="width:700px; height:500px;  overflow-x:hidden; 
 			overflow-y:auto; 
			padding:10px; background-color: #dae5f1;border: 1px solid #101010;">
상대방이 먼저 문제를 맞출경우 자동으로 다음 문제로 넘어갑니다.
오답을 선택할 시 상대방이 문제를 다 풀때까지 기다려야 합니다.
키패드의 1,2,3,4 버튼을 이용하여 정답을 전송할 수 있습니다.
방을 만들 때 설정한 문제 개수를 모두 맞추는 유저가 이기며, 상대방의 포인트를 뺏어갑니다.
테스트중이므로 중복된 문제가 나올 수 있습니다.
			</div>
			<div class="col-md-3">
			<br><br>
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button1" onclick="buttonA()">키패드1</a>
			</div>
			<div class="col-md-3">
			<br><br>
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button2" onclick="buttonB();">키패드2</a>
			</div>
			<div class="col-md-3">
			<br><br>
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button3" onclick="buttonC();">키패드3</a>
			</div>
			<div class="col-md-3">
			<br><br>
				<a class="btn btn-success btn-lg btn-block" role="button"
					id="button4" onclick="buttonD();">키패드4</a>
			</div>
		</div>

		<div class="col-xs-3">
			<textarea class="form-control" rows="4" placeholder="접속자 확인 하는 곳"
				id="connectionCheck" style="background-color: transparent;" readonly></textarea>
			<br>
			<div class="col-md-10" id="messageWindow"
			style="width:300px; height:300px;  overflow-x:hidden; 
 			overflow-y:auto; 
			padding:10px; background-color: #d4d7da;border: 1px solid #101010;"></div>
			<br>
			<br>
			<div class="col-xs-9">
			<br>
				<input type="text" class="form-control" id="inputMessage"
					onkeyup="enterkey();">
			</div>
			
			<div class="col-xs-3">
			<br>
				<input type="button" class="btn btn-default" value="전송"
					onclick="messagesend();" />
				<br><br><br><br>
			</div>
			<br> <br> <br>
			<%
				if (session.getAttribute("u_id").equals(user01)) {
			%>
			<div class="col-xs-6">
				<a class="btn btn-danger btn-lg btn-block" onclick="giveUp();" role="button">포기</a>
			</div>
			<div class="col-xs-6">
				<a class="btn btn-success btn-lg btn-block" role="button"
					onclick="gamestart();">시작</a>
			</div>
			<%
				} else {
			%>
			<div class="col-xs-12">
				<a class="btn btn-danger btn-lg btn-block" onclick="giveUp();" role="button">포기하기</a>
			</div>

			<%
				}
			%>
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
		var q_type = document.getElementById('q_type').value;
		var me = document.getElementById('me').value;
		var people = document.getElementById('people').value;
		var button1 = document.getElementById('button1');
		var button2 = document.getElementById('button2');
		var button3 = document.getElementById('button3');
		var button4 = document.getElementById('button4');
		var but1value;
		var but2value;
		var but3value;
		var but4value;
		var code;

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
			connectionCheck.value += user01 + "\n";
			webSocket.send("sessionValue:" + br_num + ":" + me);
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

			// 채팅
			if (strArray[0] == "messageSend" && strArray[1] == br_num) {
				textarea.innerHTML += strArray[2] + " : " + strArray[3] + "<br>";
				 textarea.scrollTop = textarea.scrollHeight;
			}
			
			// 접속자 확인
			// message = "checkPeople:" + br_num + ":" + me;
			if (strArray[0] == "checkPeople" && strArray[1] == br_num) {
				connectionCheck.value += strArray[2] + "\n";
			}
			// 방장이 게임 시작 버튼을 눌러서 메세지를 받을 때
			// message = "getget:" +br_num+":"+code+":"+question+":"+answer+":"+wa1+":"+wa2+":"+wa3+":";
			// 0.구분문자 1.방번호 2.코드 3.문제 4.정답 5.오답1 6.오답2 7.오답3
			if (strArray[0] == "getget" && strArray[1] == br_num) {
				code = strArray[2];
				windowQuiz.innerHTML = "<h1><font color=green>Q</font></h1>"+ "<h1>"+strArray[3];+"<h1>"
				button1.innerHTML = strArray[4];
				button2.innerHTML = strArray[5];
				button3.innerHTML = strArray[6];
				button4.innerHTML = strArray[7];
				but1value = strArray[4];
				but2value = strArray[5];
				but3value = strArray[6];
				but4value = strArray[7];

			}

			// 게임 시작인원 부족할 때 받는 메시지
			// message = "people_cnt_check:"+br_num+":인원이 부족합니다.:";
			if (strArray[0] == "people_cnt_check" && strArray[1] == br_num) {
				windowQuiz.innerHTML = strArray[2];
			}

			// message = "wrong:"+br_num+":틀렸습니다. 상대방이 문제를 풀 동안 기다려 주세요:ㅋㅋㅋㅋㅋ";
			if (strArray[0] == "wrong" && strArray[1] == br_num) {
				windowQuiz.innerHTML = strArray[2];
				button1.innerHTML = strArray[3];
				button2.innerHTML = strArray[3];
				button3.innerHTML = strArray[3];
				button4.innerHTML = strArray[3];
				but1value = strArray[3];
				but2value = strArray[3];
				but3value = strArray[3];
				but4value = strArray[3];
			}

			// 유저가 정답을 맞춰서 다음 문제로 넘어가야 할 때
			// message = "next:"+br_num+":";
			if (strArray[0] == "next" && strArray[1] == br_num) {
				nextsend();
			}
			
			// 정답 개수를 다 채웠을 때
			// message = "exit:" + br_num + ":";
			if (strArray[0] == "exit" && strArray[1] == br_num) {
				exit();
			}
		}

		function messagesend() {
			if (inputMessage.value == "") {
			} else {
				textarea.innerHTML += "<h5 align=right>"+  inputMessage.value + "</h5>";
				webSocket.send("messageSend:" + br_num + ":" + me + ":"
						+ inputMessage.value);
				inputMessage.value = "";
				 textarea.scrollTop = textarea.scrollHeight;
			}
		}

		// 방장이 게임 시작 버튼을 눌렀을 때
		function gamestart() {
			webSocket.send("gameStart:" + br_num + ":" + me + ":" + q_type);
		}

		// 유저가 답을 누르면 다음 문제로 넘어가기 위한 버튼
		function nextsend() {
			webSocket.send("nextSend:" + br_num + ":" + me + ":" + q_type);
		}
		
		// 게임이 끝나고 나간다.
		function exit() {
			webSocket.close();
			window.location.href="/GuiltyPleasure/battle?cmd=EXIT&br_num="+br_num+"";
		}
		
		// 게임을 포기하고 나간다.
		function giveUp() {
			webSocket.close();
			window.location.href="/GuiltyPleasure/battle?cmd=GIVEUP&br_num="+br_num+"&u_id="+me+"";
		}

		// 유저가 답을 눌렀을 때
		function buttonA() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but1value);
		}
		// 유저가 답을 눌렀을 때
		function buttonB() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but2value);
		}
		// 유저가 답을 눌렀을 때
		function buttonC() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but3value);
		}

		// 유저가 답을 눌렀을 때
		function buttonD() {
			webSocket.send("button:" + br_num + ":" + me + ":" + code + ":"
					+ but4value);
		}

		function enterkey() {
			if (window.event.keyCode == 13) {
				messagesend();
			}
		}

		// 키 값 반응시키기
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if (kcode == 116)
				event.returnValue = false;

			if (kcode == 97 || kcode == 35) {
				buttonA();
			}
			if (kcode == 98 || kcode == 40) {
				buttonB();
			}
			if (kcode == 99 || kcode == 34) {
				buttonC();
			}
			if (kcode == 100 || kcode == 37) {
				buttonD();
			}
		}
	</script>




</body>
</html>