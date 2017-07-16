<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<!-- 

	배틀 대기실 페이지

 -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	$(function() {
		$("#btnPopup").click(function() {
			$("#theModal").modal();
		});
	});

	function fnRead(u_id, br_num, br_type) {
		document.frmRead.bangjang.value = u_id;
		document.frmRead.br_num.value = br_num;
		if (br_type == "연예") {br_type = "A"	};
		if (br_type == "넌센스") {br_type = "B"};
		if (br_type == "상식") {br_type = "C"	};
		if (br_type == "아재") {br_type = "D"};
		document.frmRead.br_type.value = br_type;
		document.frmRead.submit();
	}
</script>
<title>배틀 대기방</title>
</head>

<body>
	<%@ include file="/nav.jsp"%>
	<input type="hidden" id="u_id" value="${u_id}" />
	<input type="hidden" id="single" value="${udto.no_single}" />
	<input type="hidden" id="battle" value="${udto.no_battle}" />
	<br><br><br><br><br><br><br><br>
	<h2><center>배틀 대기방</center></h2>
	<br><br><br>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">퀴즈 유형</th>
					<th class="text-center">문제 개수</th>
					<th class="text-center">포인트</th>
					<th class="text-center">생성자</th>
					<th class="text-center">인원수</th>
					<th class="text-center">게임상태</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${fn:length(list) == 0}">
					<tr>
						<td colspan="8" align="center">현재 대기중인 게임이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${fn:length(list) != 0}">
					<c:forEach var="roomList" items="${list}" varStatus="status">
						<tr class="text-center">
							<td>${status.count}</td>
							<td><a
								href="javascript:fnRead('${roomList.u_id}', '${roomList.br_num}', '${roomList.br_type}')">${roomList.br_subject}</a></td>
							<td>${roomList.br_type}</td>
							<td>${roomList.br_cnt}</td>
							<td>${roomList.br_point}</td>
							<td>${roomList.u_id}</td>
							<td>${roomList.br_people}</td>
							<c:if test="${roomList.br_gamestate eq 'Y'}">
								<td><font color="red">${roomList.br_gamestate}</font></td>
							</c:if>
							<c:if test="${roomList.br_gamestate eq 'N'}">
								<td>${roomList.br_gamestate}</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<hr />
		<div class="col-md-12 portfolio-item" align="right">
			<a class="btn btn-default pull-right" href="#makeRoom"
				data-toggle="modal" id="btnPopup">방만들기</a>
		</div>

		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>



	<!-- 방만들기 모달 -->
	<div class="modal fade" id="makeRoom" data-backdrop="static">
		<form class="form-horizontal" method="post"
			action="/GuiltyPleasure/battle?cmd=MAKEROOM">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3>배틀 방 만들기</h3>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="br_subject" class="col-sm-2 control-label">방제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="br_subject"
									id="br_subject" placeholder="제목을 입력해주세요">
							</div>
						</div>
						<div class="form-group">
							<label for="br_pw" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control onlyNumber" name="br_pw"
									id="br_pw" placeholder="비밀번호 4자리를 입력해 주세요" maxlength="4">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">포인트</label>
							<div class="col-sm-10">
								<input type="text" class="form-control onlyNumber"
									name="br_point" id="br_point" placeholder="포인트를 입력해주세요">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">문제수</label>
							<div class="col-sm-10">
								<select class="form-control" name="br_cnt" id="br_cnt">
									<option>5</option>
									<option>10</option>
									<option>15</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">퀴즈
								유형</label>
							<div class="col-sm-10">
								<select class="form-control" name="br_type" id="br_type">
									<option value="A">연예</option>
									<option value="B">넌센스</option>
									<option value="C">상식</option>
									<option value="D">아재</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<!-- battleCreation.jsp로 넘긴다. -->
						<button type="submit" class="btn btn-primary">만들기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 방만들기 모달 종료-->
	<form name="frmRead" method="post"
		action="/GuiltyPleasure/battle?cmd=ENTERROOM">
		<input type="hidden" name="bangjang" /> <input type="hidden"
			name="br_num" /> <input type="hidden" name="br_type" />
	</form>
	<script>
		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});
	</script>
</body>
</html>