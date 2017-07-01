<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/showModalDialog.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenav.js" charset='utf-8'></script>
<script>
$(document).ready(function(){
	$("#genre").val('<c:out value="${dto.q_type}" default=""/>');
	
	$("#update").click(function(){
		$("#select").val($("#genre").val());
		
		if($("#q_question").val()==""){
			alert("문제를 입력하세요");
			return false;
		}		
		if($("#genre option:selected").val()==""){
			alert("유형을 선택하세요");
			return false;
		}
		if($("#q_answer").val()==""){
			alert("정답을 입력하세요")
			return false;
		}
		if($("#q_wa_a").val()==""){
			alert("오답1을 입력하세요")
			return false;
		}
		if($("#q_wa_b").val() == ""){
			alert("오답2를 입력하세요")
			return false;
		}
		if($("#q_wa_c").val()==""){
			alert("오답3을 입력하세요")
			return false;
		}
		if(confirm('퀴즈의 내용을 업데이트 합시겠습니까?')){
			updateAjax();
		}
	});
	
	function updateAjax(){
		$.ajax({
			type:"POST",
			url :'/GuiltyPleasure/quizinfo?cmd=UPDATE',
			data: $('#quizInfoForm').serialize().replace(/%/g,'%25'),
			success:function(args){   
		    	alert("업데이트 성공");
		    	moveinfo();
		    },     
		    error:function(e){  
		    	alert("업데이트 실패");
		    }  
		});
	}
	
	$("#delete").click(function(){
		if(confirm('퀴즈를 삭제 하시겠습니까?')){
			deleteAjax($("#q_code").val());
		}
	});
	
	function deleteAjax(id){
		$.ajax({
			type:"POST",
			url :'/GuiltyPleasure/quizinfo?cmd=DELETE',
			data : {
				q_code : id
			},
			success:function(args){   
		    	alert("퀴즈 삭제 성공");
		    	moveinfo();
		    },     
		    error:function(e){
		    	alert("퀴즈 삭제 실패");  
		    }  
		});
	}

	function moveinfo(){
		$("#select").val("");
		$("#cmd").val('LIST');
		$("#quizInfoForm").submit();
	}
	$("#btnList").click(moveinfo);
});

</script>
</head>
<body>
<%@include file="../../top2.jsp" %>
<form method="post" action="/GuiltyPleasure/quizinfo" name="quizInfoForm" id="quizInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<input type="hidden" name="q_code" id="q_code" value="${dto.q_code }"/>
<input type="hidden" name="select" id="select" />
<!-- 페이지 처리 -->
<div class="subCC">
<h2 class="subTitle">퀴즈 상세 정보</h2>
<hr class="margin20">
<table class="infoTable">
	<colgroup>
		<col style="width:20%;">
		<col style="width:30%;">
		<col style="width:20%;">
		<col style="width:30%;">
	</colgroup>
<tr><th>퀴즈번호</th>
	<td>${dto.q_code}</td>
	<th>퀴즈유형</th>
	<td><select name="genre" id="genre">
			<option value="">문제 유형 선택</option>
			<option value="A">연애</option>
			<option value="B">넌센스</option>
			<option value="C">언어</option>
			<option value="D">상식</option>
		</select>
	</td>
</tr>
<tr><th>문제</th>
	<td colspan="3"><input type="text" name="q_question" id="q_question" value="${dto.q_question}" size="100"/></td>
</tr>
<tr><th>정답</th>
	<td><input type="text" name="q_answer" id="q_answer"value="${dto.q_answer}" /></td>
	<th>오답1</th>
	<td><input type="text" name="q_wa_a" id="q_wa_a" value="${dto.q_wa_a}" /></td>
</tr>
<tr><th>오답2</th>
	<td><input type="text" name="q_wa_b" id="q_wa_b" value="${dto.q_wa_b}" /></td>
	<th>오답3</th>
	<td><input type="text" name="q_wa_c" id="q_wa_c" value="${dto.q_wa_c}" /></td>
</tr>
</table>
<hr class="margin20">
<table>
	<tr>
		<td style="text-align: right">
			<input type="button" value="수정" class="btnStyle2 midBlack" id="update" />
			<input type="button" value="삭제" class="btnStyle2 midBlack" id="delete"/>
			<input type="button" value="메인" class="btnStyle2 midBlue" id="btnList" />
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>