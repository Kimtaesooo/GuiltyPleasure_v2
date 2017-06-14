<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css?ver=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenav.js" charset='utf-8'></script>
<script type="text/javascript">
$(document).ready(function(){
	$("tr[id^='move']").click(function(){
		$("#userid").val($(this).children("td[id^='uid']").text());
		$("#cmd").val("INFO");
		$("#userListForm").submit();
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
		$("#cmd").val("LIST");
		$("#userListForm").submit();
	}
	
	$("#btnSearch").click(movelist);
});
</script>
</head>
<body>
<%@include file="../../top.jsp" %>
<form method="post" action="/GuiltyPleasure/userinfo" name="userListForm" id="userListForm">
<input type="hidden" name="cmd" id="cmd"/>
<input type="hidden" name="userid" id="userid"/>
<input type="hidden" name="pageno" value="${pageno }"/>
<input type="hidden" name="order" id="order"/>
<input type="hidden" name="ordertype" id="ordertype" value="${ordertype }"/>
<div class="subCC">
	<h2 class="subTitle">회원 정보 목록</h2>
	<table class="infoTable">
		<colgroup>
			<col style="width:30%;">
			<col style="width:70%;">
		</colgroup>
		<tr>
			<th>아이디</th>
			<td colspan="7"><input type="text" name="id" value="${searchInfo }"/><input type="button" id="btnSearch" class="btnInTable" value="검색" /></td>
		</tr>
	</table>
	<hr class="margin20">
	<c:if test="${empty list}">
			<hr class="margin10">
			<h2 style="text-align: center;">유저 정보가  없습니다.</h2>
		</c:if>
	<c:if test="${fn:length(list) > 0}">
	<table class="infoTable">
		<colgroup>
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:15%;">
		</colgroup>
		<tr id="sortTr">
			<th id="UM.U_ID">아이디</th>
			<th id="UM.UM_CHAT">채팅</th>
			<th id="UM.UM_ENROLL">글쓰기</th>
			<th id="UM.UM_SINGLE">싱글</th>
			<th id="UM.UM_BATTLE">배틀</th>
			<th id="UM.UM_ENTRY">정지</th>
			<th id="A.U_DELETE">삭제</th>
		</tr>		
		<c:forEach var="info" items="${list}" varStatus="num">
			<tr id="move${num.index}">
				<td style="text-align: center;" id="uid${num.index}">${info.id }</td>
				<td style="text-align: center;">${info.no_chat }</td>
				<td style="text-align: center;">${info.no_enroll }</td>
				<td style="text-align: center;">${info.no_single }</td>
				<td style="text-align: center;">${info.no_battle }</td>
				<td style="text-align: center;">${info.no_entry }</td>
				<td style="text-align: center;">${info.delete }</td>
			</tr>
		</c:forEach>		
	</table>		
	<hr class="margin20">
	<table id="pageNavi" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td align="center">
				<div>
					<script type="text/javascript">
						document.write(pageNav( "gotoPage", <c:out value="${pageno}"/>, '10', <c:out value="${total}"/>, 'LIST' ,'userListForm'));
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