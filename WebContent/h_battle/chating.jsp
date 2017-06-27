<%@page import="dto.Battle_Chating"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="chat.css" />
<title>Insert title here</title>
</head>
<body>
<script src="ajax.js"></script>
<jsp:useBean id="dto" class="dto.Battle_Chating"></jsp:useBean>
<%JSONObject json  = null;%>
<script>
function fnProcess(){
	
	var param ="cmd=CHATING";
	sendRequest("POST","/GuiltyPleasure/battle", param, callback);
}

function callback(){
	var json;
	if(httpRequest.readyState==4){
		if(httpRequest.status == 200){
			json = httpRequest.responseText;
		//	alert(json);

			// 채팅내용 보여주기
			chatManager.show(json.data);
			
			// 채팅내용 가져오기
			chatManager.proc();
		}else{
			alert(httpRequest.status);
		}
	}
}

var chatManager = new function(){
	// 채팅내용 가져오기
	this.proc = function()
	{
	    // Ajax 통신
	 
	}

	// 채팅내용 보여주기
	this.show = function(data)
	{
	    var o = document.getElementById('area');
	    o.value = data;
	
	}
	
}

// interval에서 지정한 시간마다 실행 - [제거]
// setInterval(this.proc, interval);

//페이지 로딩을 끝마치면 채팅내용 가져오기 시작 [추가]
</script>
	
	<textarea rows="50" cols="50" id="area">
		
	</textarea>
	<input name="name" id="name" type="text" />
	<input name="msg" id="msg" type="text" />
	<input name="btn" id="btn" type="button" value="입력"  onclick="fnProcess()"/>
	
</body>
</html>