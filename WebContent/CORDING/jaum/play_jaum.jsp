<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="dao" class="dao.rankmodule.rank"/>
<title>chat</title>
<%
	String id = (String)session.getAttribute("u_id");
	String nick = (String)session.getAttribute("u_nickname");
	int num=999;
	if(id!=null){
	num = dao.BattleMyRank(id);
	}
%>	
	
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
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br>
<%if(id!=null){ %>
<div class="container">
<div class="col-md-1"> </div>
<div id="chat" class="col-lg-8"
style="overflow:scroll; width:700px; height:500px; 
padding:10px; background-color: #d3e4e2;">
자음퀴즈방 ~ 맞추면 5포인트 ~ '문제줘' 입력시 출제 모르면 '포기'<br>
</div>
<div class="col-md-4" id="state"
style="overflow:scroll; width:300px; height:500px; 
padding:10px; background-color: #d3e4e2;">
참여자 정보<br>
</div>
<br>
<div class="col-md-12">
	<div class="col-md-1"></div>
	<div class="col-md-9">
	<input type="text" size="60" id="inputMessage" onkeyup="enterkey()">
	</div>
	<div class="col-md-2">
	<a href="javascript:out()" class="btn btn-danger">나가기</a>
	</div>
</div>
</div>



<input type="hidden" value="<%=id%>" id="id">
<input type="hidden" value="<%=nick%>" id="nick">
<input type="hidden" value="<%=num%>" id="num">
<script>
		var textarea = document.getElementById("chat");
		var state = document.getElementById("state");
		var id = document.getElementById("id").value;
		var nick = document.getElementById("nick").value;
		var num =  document.getElementById("num").value;
		var webSocket = new WebSocket("ws://70.12.110.113:8080/GuiltyPleasure/main_chat");
		var inputMessage = document.getElementById("inputMessage");
		var strArr;
		var rank="";
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
	    	webSocket.send("firstlogin"+"div"+nick);
	    	webSocket.onOpen(event);
	    }
	    function onClose(session) {
	    	webSocket.onClose(event);

	    }
	    function onError(event) {
	      alert(event.data);
	    }
	    function out(){
	    	webSocket.send("sessionEnd"+"div"+nick);
	    	location.href="../../main.jsp";
	    }
	    
	    function onMessage(event) {
	    	
	    	strArr = event.data.split('div');
	    	if(strArr[0]=="list"){
	    		strArr = event.data.split('div');
	    		state.innerHTML = strArr[1]
	    	}
	    	
	    	else{
	    		if(strArr[2]==null){
	    			 textarea.innerHTML += "<h4>"+strArr[1]+"님이 들어오셨습니다.</h4>"
	    			 if(strArr[0]=="out"){
	 		    		textarea.innerHTML += "<h4>"+strArr[1]+"님이 나가셨습니다.</h4>"
	 		    	}
	    		}
	    		
	    		else{  textarea.innerHTML += 
	        			"<h6>"+strArr[2]+" "+strArr[0]+" : "+strArr[1] +"</h6>";
	       			 textarea.scrollTop = textarea.scrollHeight;}
	    	}
	    }
	    function send() {
	    	if (inputMessage.value == ""){}
	    	else{    		
	    		if(num==1){
		    		rank = "<font color=blue size=5>1위</font>"
		    	}
	    		else if(num==2){
	    			rank = "<font color=red size=3>2위</font>"
	    		}
	    		else if(num==3){
	    			rank = "<font color=green size=2>3위</font>"
	    		}
	    		else if(num>0){
	    			rank = "<font>"+num+"위</font>"
	    		}
	    		else{
	    			rank = "초보"
	    		}
	        	textarea.innerHTML += "<h5 align=right>" + inputMessage.value + "</h5>";
	        	webSocket.send( nick+"div"+inputMessage.value+"div"+rank);
	        	inputMessage.value = "";
	       	  textarea.scrollTop = textarea.scrollHeight;
	
	    	}
	    }
	    
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	        }
	    }
	</script>
<%}else{ %>
<h1 align="center">로그인 후 이용가능한 서비스 입니다.</h1>
<% }%>
</body>

</html>