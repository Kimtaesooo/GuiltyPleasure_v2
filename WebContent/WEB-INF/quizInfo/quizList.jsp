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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenav.js" charset='utf-8'></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#genre").val('<c:out value="${searchInfo.q_type}" default=""/>');
	$("tr[id^='move']").click(function(){
		$("#qcode").val($(this).children("td[id^='qcode']").text());
		$("#cmd").val("INFO");
		$("#quizInfoForm").submit();
	});
	
	$("#sortTr").children().click(function(){
		if($("#ordertype").val() == "asc"){
			$("#ordertype").val("desc");
		}else{
			$("#ordertype").val("asc");
		}
		$(order).val($(this).attr("id"));
		movelist();
	});
	
	function movelist(){
		$("#select").val($("#genre").val());
		$("#cmd").val("LIST");
		$("#quizInfoForm").submit();
	}
	
	$("#btnSearch").click(movelist);
	$("#btnClear").click(function(){
		$("input[type='text']").val("");
	});
});
</script>
</head>
<body>
<%@include file="../../top2.jsp" %>
<form method="post" action="/GuiltyPleasure/quizinfo" name="quizInfoForm" id="quizInfoForm">
<input type="hidden" name="cmd" id="cmd"/>
<input type="hidden" name="qcode" id="qcode"/>
<input type="hidden" name="pageno" value="${pageno }"/>
<input type="hidden" name="order" id="order" value="${order }"/>
<input type="hidden" name="select" id="select"/>
<input type="hidden" name="ordertype" id="ordertype" value="${ordertype }"/>
<div class="subCC">
	<h2 class="subTitle">등록 퀴즈 목록</h2>
	<table class="infoTable">
		<colgroup>
			<col style="width:20%;">
			<col style="width:30%;">
			<col style="width:20%;">
			<col style="width:30%;">
		</colgroup>
		<tr>
			<th>등록자</th>
			<td><input type="text" name="uid" value="${searchInfo.u_id }"/></td>
			<th>유형</th>
			<td><select name="genre" id="genre">
					<option value="">문제 유형 선택</option>
					<option value="A">연애</option>
					<option value="B">넌센스</option>
					<option value="C">언어</option>
					<option value="D">상식</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>문제</th>
			<td colspan="3"><input type="text" name="qquestion" value="${searchInfo.q_question }" size="100"/></td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: right"><input type="button" id="btnSearch" class="btnInTable" value="검색" />
				<input type="button" id="btnClear" class="btnInTable" value="초기화" />
			</td>
		</tr>
	</table>
	<hr class="margin20">
	<c:if test="${empty list}">
			<hr class="margin10">
			<h2 style="text-align: center;">퀴즈 정보가  없습니다.</h2>
		</c:if>
	<c:if test="${fn:length(list) > 0}">
	<table class="infoTable" style="table-layout:fixed">
		<colgroup>
			<col style="width:10%;">
			<col style="width:10%;">
			<col style="width:50%;">
			<col style="width:30%;">

		</colgroup>
		<tr id="sortTr">
			<th id="Q.Q_CODE" style="text-align: center;">번호</th>
			<th id="Q.Q_TYPE" style="text-align: center;">타입</th>
			<th id="Q.Q_QUESTION" style="text-align: center;">문제</th>
			<th id="Q.U_ID" style="text-align: center;">등록자</th>
		</tr>		
		<c:forEach var="info" items="${list}" varStatus="num">
			<tr id="move${num.index}">
				<td style="text-align: center;" id="qcode${num.index}">${info.q_code }</td>
				<td style="text-align: center;">${info.q_type }</td>
				<td style="text-align: center; overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${info.q_question }</td>
				<td style="text-align: center;">${info.u_id }</td>
			</tr>
		</c:forEach>		
	</table>		
	<hr class="margin20">
	<table id="pageNavi" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td align="center">
				<div>
					<script type="text/javascript">
						document.write(pageNav( "gotoPage", <c:out value="${pageno}"/>, '10', <c:out value="${total}"/>, 'LIST' ,'quizInfoForm'));
					</script>
				</div>
			</td>
		</tr>
	</table>
	</c:if>
	</div>
</form>
</body>
</html>