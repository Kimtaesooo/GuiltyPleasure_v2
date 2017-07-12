<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/showModalDialog.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenav.js" charset='utf-8'></script>
<script>
$(document).ready(function(){
	$("#chat").val('<c:out value="${dto.no_chat}" default=""/>');
	$("#single").val('<c:out value="${dto.no_single}" default=""/>');
	$("#battle").val('<c:out value="${dto.no_battle}" default=""/>');
	$("#enroll").val('<c:out value="${dto.no_enroll}" default=""/>');
	$("#entry").val('<c:out value="${dto.no_entry}" default=""/>');
	$("#delete").val('<c:out value="${dto.delete}" default=""/>');
	
	$("#btnQuit").click(function(){
		if(confirm('오늘부로 해당 유저를 탈퇴처리 합니다.\n탈퇴처리 하시겠습니까?')){
			banuserAjax($("#userid").val());
		}
	});
	
	function banuserAjax(id){
		$.ajax({
			type:"POST",
			url :'/GuiltyPleasure/userinfo?cmd=QUIT',
			data : {
				id : id
			},
			success:function(args){   
		    	alert("탈퇴처리 성공");
		    	moveinfo();
		    },     
		    error:function(e){  
		    	alert("탈퇴처리 실패");
		    }  
		});
	}
	
	function fntoday(){
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = date.getMonth()+1>9?date.getMonth()+1:'0'+(date.getMonth()+1); 
		var day = date.getDate()>9?date.getDate():'0'+date.getDate();
		var currday = year + "-" + month + "-" + day;
		return currday;
	}
	
	$("#btnRestriction").click(function(){
		var today = fntoday();
		var option = '';
		/*로드중에 태그에서 값 호출시 값을 못받을수 있음 */
		var battle = $("#battle").val();
		var enroll = $("#enroll").val();
		var chat = $("#chat").val();
		var single = $("#single").val();
		var entry = $("#entry").val();
		
		if($("#inputenroll").val() =='' && enroll.length>0){
			alert('글쓰기 금지된 정보가 있는 유저입니다. 글쓰기 금지일자를 삭제하실수 없습니다.');
			return ;
		}
		
		if($("#inputenroll").val().length>0){
			if(today >= $("#inputenroll").val()){
				alert(today+' 이후를 글쓰기 금지일로 선택할수 있습니다.');
				return ;
			}		
			
			if(enroll > $("#inputenroll").val()){
				alert('글쓰기 금지 지정일은 저장된 날보다 이전일로 갱신할수 없습니다.');
				return ;
			}
			option += 'um_enroll='+$("#inputenroll").val()+' ';
		}else{
			if($("#inputenroll").val().length>0){
				option += 'um_enroll='+$("#inputenroll").val()+' ';
			}
		}
		
		/*채팅*/
		if($("#inputchat").val()== ''  && chat.length>0){
			alert('채팅 금지된 정보가 있는 유저입니다. 채팅 금지일자를 삭제하실수 없습니다.');
			return ;
		}
		if($("#inputchat").val().length>0){
			if(today >= $("#inputchat").val()){
				alert(today+' 이후를 채팅 금지일로 선택할수 있습니다.');
				return ;
			}		
			
			if(chat > $("#inputchat").val()){
				alert('채팅 금지 지정일은 저장된 날보다 이전일로 갱신할수 없습니다.');
				return ;
			}
			option += 'um_chat='+$("#inputchat").val()+' ';
		}else{
			if($("#inputchat").val().length>0){
				option += 'um_chat='+$("#inputchat").val()+' ';
			}
		}
		
		/*싱글*/
		if($("#inputsingle").val() =='' && single.length>0){
			alert('싱글플레이가 금지된 정보가 있는 유저입니다. 싱글플레이 금지일자를 삭제하실수 없습니다.');
			return ;
		}
		if($("#inputsingle").val().length>0){
			if(today >= $("#inputsingle").val()){
				alert(today+' 이후를 싱글플레이 금지일로 선택할수 있습니다.');
				return ;
			}		
			
			if(single > $("#inputsingle").val()){
				alert('싱글플레이 금지 지정일은 저장된 날보다 이전일로 갱신할수 없습니다.');
				return ;
			}
			option += 'um_single='+$("#inputsingle").val()+' ';
		}else{
			if($("#inputsingle").val().length>0){
				option += 'um_single='+$("#inputsingle").val()+' ';
			}
		}
		
		/*배틀*/
		if($("#inputbattle").val() =='' && battle.length>0){
			alert('배틀 금지된 정보가 있는 유저입니다. 배틀 금지일자를 삭제하실수 없습니다.');
			return ;
		}
		if($("#inputbattle").val().length>0){
			if(today>=$("#inputbattle").val()){
				alert(today+' 이후를 배틀 금지일로 선택할수 있습니다.');
				return ;
			}		
			
			if(battle>$("#inputbattle").val()){
				alert('배틀 금지 지정일은 저장된 날보다 이전일로 갱신할수 없습니다.');
				return ;
			}
			option += 'um_battle='+$("#inputbattle").val()+' ';
		}else{
			if($("#inputbattle").val().length>0){
				option += 'um_battle='+$("#inputbattle").val()+' ';
			}
		}
		
		/*접속정지*/
		if($("#inputentry").val() =='' && entry.length>0){
			alert('접속 정지 정보가 있는 유저입니다. 접속 정지일자를 삭제하실수 없습니다.');
			return ;
		}
		if($("#inputentry").val().length>0){
			if(today>$("#inputentry").val()){
				alert('오늘보다 이전일을 접속정지일로 선택할수 없습니다.');
				return ;
			}		
			
			if(entry>=$("#inputentry").val()){
				alert(today+' 이후를 접속 금지일로 선택할수 있습니다.');
				return ;
			}
			option += 'um_entry='+$("#inputentry").val()+' ';
		}else{
			if($("#inputentry").val().length>0){
				option += 'um_entry='+$("#inputentry").val()+' ';
			}
		}
		
		if(option.length<1){
			alert("입력이 없습니다. 사용자 목록으로 돌아갑니다.")
			moveinfo();
			return false;
		}
		
		if((battle == $("#inputbattle").val()) &&
			(enroll == $("#inputenroll").val()) &&
			(chat == $("#inputchat").val()) &&
			(single == $("#inputsingle").val()) &&
			(entry == $("#inputentry").val())){
				alert("변경된 사항이 없습니다. 사용자 목록으로 돌아갑니다.")
				moveinfo();
				return false;
		}
		
		if(confirm('해당 유저를 제재하겠습니까?')){
			/*업데이트 이벤트 */
			userrestrictionAjax(option, $("#userid").val());
		}
	
		function userrestrictionAjax(v, id){
			$.ajax({
				type:"POST",
				url :'/GuiltyPleasure/userinfo?cmd=RESTRICTION',
				data : {
					param : v,
					id : id
				},
				success:function(args){   
			    	alert("사용자 제재 성공");
			    	moveinfo();
			    },     
			    error:function(e){  
			    	alert("사용자 제재 실패");  
			    }  
			});
		}
	});
	
	function moveinfo(){
		$("#cmd").val('LIST');
		$("#pagesize").val('10');
		$("#userInfoForm").submit();
	}	
	$("#btnEraseRestriction").click(function(){
		
		var info = '';
		
		var enroll = $("#enroll").val();
		if(enroll.length>0) info += '글쓰기금지=enroll ';
		var chat = $("#chat").val();
		if(chat.length>0) info += '채팅금지=chat ';
		var single = $("#single").val();
		if(single.length>0) info += '싱글금지=single ';
		var battle = $("#battle").val();
		if(battle.length>0) info += '배틀금지=battle ';		
		var entry = $("#entry").val();
		if(entry.length>0) info += '접속금지=entry ';
		var del = $("#delete").val();
		if(del != 'N') info += '탈퇴=del ';
		
		if(info.length == 0){
			alert('제재내역이 없는 사용자 입니다.');
			return ;
		}
		
		var param = 'dialogWidth:400px; dialogHeight:500px; center:yes; help:no; status:no; scroll:no; resizable:no; modal:yes';
		var msgDialog = window.showModalDialog('/GuiltyPleasure/userinfo?cmd=POP', info, param);
		
		showModalDialogCallback = function(msgDialog){
			if(msgDialog){		 
				deleterestrictionAjax(msgDialog, $("#userid").val());
			}
		}
		
		function deleterestrictionAjax(v, id){
			$.ajax({
				type:"POST",
				url :'/GuiltyPleasure/userinfo?cmd=DELETERESTRICTION',
				data : {
					param : v,
					id : id
				},
				success:function(args){   
			    	alert("사용자 제재 삭제 성공");
			    	moveinfo();
			    },     
			    error:function(e){  
			    	alert("사용자 제재 삭제 실패");  
			    }  
			});
		}
	});	
	$("#btnMain").click(moveinfo);
});	
</script>
</head>
<body>
<%@include file="../../top2.jsp" %>
<form method="post" action="/GuiltyPleasure/userinfo" name="userInfoForm" id="userInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<input type="hidden" name="userid" id="userid" value="${dto.id }"/>
<!-- 데이터 관리용 -->
<input type="hidden" name="chat" id="chat"/>
<input type="hidden" name="single" id="single"/>
<input type="hidden" name="battle" id="battle"/>
<input type="hidden" name="enroll" id="enroll"/>
<input type="hidden" name="entry" id="entry"/>
<input type="hidden" name="delete" id="delete"/>
<!-- 페이지 처리 -->
<input type="hidden" name="pageno"/>
<div class="subCC">
<h2 class="subTitle">회원 상세 정보</h2>
<hr class="margin20">
<h2>기능 금지</h2>
<hr class="margin10">
<table class="infoTable">
		<colgroup>
			<col style="width:20%;">
			<col style="width:80%;">
		</colgroup>
		<tr><th>글쓰기</th>
			<td><input type="date" name="inputenroll" id="inputenroll" value="${dto.no_enroll}"/></td>
		</tr>
		<tr><th>채팅</th>
			<td><input type="date" name="inputchat" id="inputchat" value="${dto.no_chat}"/></td>
		</tr>		
		<tr><th>싱글</th>
			<td><input type="date" name="inputsingle" id="inputsingle" value="${dto.no_single}"/></td>
		</tr>
		<tr><th>배틀</th>
			<td><input type="date" name="inputbattle" id="inputbattle" value="${dto.no_battle}"/></td>
		</tr>		
		<tr><th>정지</th>
			<td><input type="date" name="inputentry" id="inputentry" value="${dto.no_entry}" /></td>
		</tr>	
</table>
<hr class="margin20">
<h2>구매 아이템</h2>
<hr class="margin10">
<c:if test="${empty itemList}">
	<hr class="margin10">
	<h2 style="text-align: center;">아이템 구매내역이  없습니다.</h2>
	<hr class="margin20">
</c:if>
<c:if test="${fn:length(itemList) > 0}">
<table class="infoTable">
	<colgroup>
		<col style="width:30%;">
		<col style="width:30%;">
		<col style="width:20%;">
		<col style="width:20%;">
	</colgroup>
	<tr>
		<th style="text-align: center;">아이템명</th>
		<th style="text-align: center;">구매일</th>
		<th style="text-align: center;">유효기간</th>
		<th style="text-align: center;">가격</th>
	</tr>
	<c:forEach var="item" items="${itemList}">
		<tr>
			<td style="text-align: center;">${item.item_name }</td>
			<td style="text-align: center;">${item.buy_date }</td>
			<td style="text-align: center;">${item.item_limit }</td>
			<td style="text-align: center;">${item.price }</td>
		</tr>
	</c:forEach>
</table>
<table id="pageNavi" style="margin-left: auto; margin-right: auto;">
	<tr>
		<td align="center">
			<div>
				<script type="text/javascript">
					document.write(pageNav( "gotoPage", <c:out value="${pageno}"/>, '5', <c:out value="${itemtotal}"/>,'INFO', 'userInfoForm'));
				</script>
			</div>
		</td>
	</tr>
</table>
</c:if>
<hr class="margin20">
<h2>그외 정보</h2>
<hr class="margin10">
<table class="infoTable">
<tr><td>자기소개</td>
	<td>${dto.introduce}</td>
</tr>
</table>
<hr class="margin20">
<table>
	<tr>
		<td style="text-align: right">
			<input type="button" value="탈퇴" class="btnStyle2 midBlack" id="btnQuit" />
			<input type="button" value="확인" class="btnStyle2 midBlack" id="btnRestriction"/>
			<input type="button" value="구원" class="btnStyle2 midBlack" id="btnEraseRestriction"/>
			<input type="button" value="메인" class="btnStyle2 midBlue" id="btnMain" />
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>