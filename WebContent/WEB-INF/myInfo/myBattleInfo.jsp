<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#btnInfo').click(function(){
		$('#cmd').val('MYINFO');
		$('#myInfoForm').submit();
	});
	
	$('#btnMain').click(function(){
		$('#cmd').val('MAIN');
		$('#myInfoForm').submit();
	});
});
</script>
</head>
<body>
<%@include file="../../top2.jsp" %>
<form method="post" action="/GuiltyPleasure/myinfo" name="myInfoForm" id="myInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<div class="subCC">
<h2 class="subTitle">회원 전적 정보</h2>
<table>
	<tr>
		<td style="text-align: right">
		<input type="button" value="나의 정보" class="btnStyle2 midBlue"  id="btnInfo" />
		<input type="button" value="메인으로" class="btnStyle2 midBlack"  id="btnMain" />
		</td>
	</tr>
</table>
	
	<hr class="margin20">
	<h3>총 전적</h3>
	<hr class="margin10">
	<c:if test="${empty dto}">
			<hr class="margin10">
			<h2 style="text-align: center;">전적 정보가  없습니다.</h2>
	</c:if>
	<c:if test="${!empty dto}">
	<table class="infoTable">
		<colgroup>
			<col style="width:25%;">
			<col style="width:25%;">
			<col style="width:25%;">
			<col style="width:25%;">
		</colgroup>
		<tr>
			<th>총전적</th>
			<th>승</th>
			<th>패</th>
			<th>승률</th>
		</tr>
		
		<tr>
			<td style="text-align: center;">${dto.ub_total}</td>
			<td style="text-align: center;">${dto.ub_win }</td>
			<td style="text-align: center;">${dto.ub_lose }</td>
			<td style="text-align: center;">${dto.ub_percent }</td>
		</tr>
	</table>
	</c:if>
	<hr class="margin20">
	<h3>유형별 전적</h3>
	<hr class="margin10">
	<c:if test="${empty poalist}">
			<hr class="margin10">
			<h2 style="text-align: center;">전적 정보가  없습니다.</h2>
	</c:if>
	<c:if test="${fn:length(poalist) > 0}">
	<table class="infoTable">
		<colgroup>
			<col style="width:40%;">
			<col style="width:20%;">
			<col style="width:20%;">
			<col style="width:20%;">
		</colgroup>
		<tr>
			<th>유형</th>
			<th>총문제</th>
			<th>정답</th>
			<th>정답률</th>
		</tr>
		<c:forEach var="poa" items="${poalist}" varStatus="num">
			<tr>
				<td style="text-align: center;">${poa.up_type }</td>
				<td style="text-align: center;">${poa.up_a_cnt }</td>
				<td style="text-align: center;">${poa.up_wa_cnt }</td>
				<td style="text-align: center;">${poa.up_total_percent }</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<hr class="margin20">
	<h3>내가 만든 문제</h3>
	<hr class="margin10">
	<c:if test="${empty regqlist}">
		<hr class="margin10">
		<h2 style="text-align: center;">내가 만든 퀴즈가 없습니다.</h2>
	</c:if>
	<c:if test="${fn:length(regqlist) > 0}">
	<table class="infoTable">
		<colgroup>
			<col style="width:25%;">
			<col style="width:35%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:10%;">
		</colgroup>
		<tr>
			<th>유형</th> 
			<th>문제</th>
			<th>정답</th>
			<th>오답</th>
			<th>처리상태</th>
		</tr>
		<c:forEach var="quiz" items="${regqlist}">
		<tr>
			<td style="text-align: center;">${quiz.q_type }</td>
			<td style="text-align: center;">${quiz.uq_question }</td>
			<td style="text-align: center;">${quiz.uq_answer }</td>
			<td style="text-align: center;" title="${quiz.uq_wa_a } &#013;${quiz.uq_wa_b } &#013;${quiz.uq_wa_c }">오답정보</td>
			<td style="text-align: center;">${quiz.uq_adopt }</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>	
	</div>
</form>
</body>
</html>