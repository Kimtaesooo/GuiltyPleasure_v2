<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnBattleInfo").click(function(){
			$("#cmd").val("MYBATTLEINFO");
			$("#myInfoForm").submit();
		});
		
		function movemain(){
			$("#cmd").val("MAIN");
			$("#myInfoForm").submit();
		}
		
		$("#btnDelete").click(function(){
			if(confirm('탈퇴 승인 이후 3개월동안 개인정보가 유지되며 로그인이 가능합니다.\n이 기간 동안 복구 요청이 가능하며 3개월이후 개인정보는 삭제됩니다.\n탈퇴요청 하시겠습까?')){
				if($("#delete").val() != 'N'){
					alert("이미 탈퇴 신청하신 사용자 입니다.");
					return ;
				}
				userDeleteAjax();
			}	
		});
		
		function userDeleteAjax(){
			$.ajax({
				type:"POST",
				url :'/GuiltyPleasure/myinfo?cmd=DELETE',
				success:function(args){   
			    	alert("탈퇴처리 성공");
			    	movemain();
			    },     
			    error:function(e){
			    	for(var key in e){
			    		alert(key+" = "+e[key]);
			    	}
			    	alert("탈퇴처리 실패");
			    }  
			});
		}
		
		$("#btnMain").click(movemain);
	});
</script>
</head>
<body>
<form method="post" action="/GuiltyPleasure/myinfo" name="myInfoForm" id="myInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<input type="hidden" name="delete" id="delete" value="${dto.delete }"/>
<div class="subCC">
<h2 class="subTitle">회원 개인 정보</h2>
<table>
	<tr>
		<td style="text-align: right">
			<input type="button" value="탈퇴요청" class="btnStyle2 midBlue"  id="btnDelete" />
			<input type="button" value="나의 랭킹" class="btnStyle2 midBlue" id="btnBattleInfo" />
			<input type="button" value="메인으로" class="btnStyle2 midBlue" id="btnMain" />
		</td>
	</tr>
</table>
	<hr class="margin20">
	<table class="infoTable">
		<colgroup>
			<col style="width:30%;">
			<col style="width:40%;">
		</colgroup>	
			<tr>
				<th>아이디</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>별명</th>
				<td>${dto.nickname }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.email }</td>
			</tr>
			<tr>
				<th>전화</th>
				<td>${dto.phone }</td>
			</tr>
			<tr>
				<th>주소</th>				
				<td>${dto.addr }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${dto.date}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${dto.gender }</td>
			</tr>
			<tr>
				<th>소개</th>
				<td>${dto.introduce }</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>