<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String u_id = (String)session.getAttribute("u_id");
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
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
	<!-- Theme Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
<!-- nav바 수정부분 -->
	<!-- sweetalert.js -->
	<script src="${pageContext.request.contextPath}/design/sweetalert-master/js/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/sweetalert-master/css/sweetalert.css" />
<!-- magic전용 js파일 -->
<script src="magic.js"></script>
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
#fh5co-hero .fh5co-overlay { background: #f5f5f5;}
#fh5co-hero .fh5co-intro h2 {color: #333333;}
#fh5co-hero .fh5co-intro p {color: #333333;}
</style>
<!-- nav바 수정부분 여기까지 -->
<script>
var magic_val = 0
var u_id ="";
var magic_img=""
	function magic_eye(eye){
		magic_img = document.getElementById("magic_img");
		magic_val = document.getElementById("magic_val");
		magic_img.src ="/GuiltyPleasure/CORDING/magic/img/"+eye.value+"magiceye3d.jpg" //매직아이 이미지
		magic_val.value = eye.value;
	}
	function magic_eye_answer()	{
		var answer = document.getElementById("magic_answer").value;
		u_id = "<%=u_id%>";
		if(magic_val.value != null){
		str = answerCheck(answer, magic_val.value);
			if(str==true){
				swal("정답입니다.");
				savepoint(u_id);
			}else{
				swal("틀렸습니다.");
			}
		}else{
			swal("그림을 선택해주세요")
		}
	}
	//이부분 처리
	function savepoint(id){
		$.ajax({
			type:"POST",
			url :'/GuiltyPleasure/magic?cmd=MAGIC',
			data : {
				id : id
			},
			success:function(args){   
		    	alert("포인트 획득");
		    },     
		    error:function(e){  
		    	alert("포인트 획득 오류");
		    }  
		});
	}
	function test(){
		swal("Message");
	}
	swal("Message");
</script>
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br><br><br>
		<div class="magiteye3d" align="center">
		<br><br>
		<input type="hidden" id="magic_val" value="">
				<img class ="center-block"  id="magic_img" src="" />
				<input type="text"  id="magic_answer" placeholder="보이는그림 입력">
				<input type="button" onclick="magic_eye_answer();" value="정답입력"></button>
		</div>
	<div class="col-lg-md-12" align="center">
	<table class="table table-bordered table-responsive" style="width:600px; height:200px;">
		<tr>
			<td class="table-hover" >
				<button value = "002" onclick="magic_eye(this);">매직아이1</button>
			</td>
			<td>
				<button value = "003" onclick="magic_eye(this);">매직아이2</button>
			</td>
				<td>
				<button value = "004" onclick="magic_eye(this);">매직아이3</button>
			</td>
				<td>
				<button value = "005" onclick="magic_eye(this);">매직아이4</button>
			</td>
				<td>
				<button value = "006" onclick="magic_eye(this);">매직아이5</button>
			</td>
		</tr>
		<tr>
				<td>
				<button value = "007" onclick="magic_eye(this);">매직아이6</button>
			</td>
				<td>
				<button value = "008" onclick="magic_eye(this);">매직아이7</button>
			</td>
				<td>
				<button value = "009" onclick="magic_eye(this);">매직아이8</button>
			</td>
				<td>
				<button value = "010" onclick="magic_eye(this);">매직아이9</button>
			</td>
				<td>
				<button value = "011" onclick="magic_eye(this);">매직아이10</button>
			</td>
		</tr>
		<tr>
				<td>
				<button value = "012" onclick="magic_eye(this);">매직아이11</button>
			</td>
				<td>
				<button value = "013" onclick="magic_eye(this);">매직아이12</button>
			</td>
				<td>
				<button value = "014" onclick="magic_eye(this);">매직아이13</button>
			</td>
				<td>
				<button value = "015" onclick="magic_eye(this);">매직아이14</button>
			</td>
			<td>
				<button value = "016" onclick="magic_eye(this);">매직아이15</button>
			</td>
		</tr>
		<tr>
				<td>
				<button value = "017" onclick="magic_eye(this);">매직아이16</button>
			</td>
				<td>
				<button value = "018" onclick="magic_eye(this);">매직아이17</button>
			</td>
				<td>
				<button value = "019" onclick="magic_eye(this);">매직아이18</button>
			</td>
				<td>
				<button value = "020" onclick="magic_eye(this);">매직아이19</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>