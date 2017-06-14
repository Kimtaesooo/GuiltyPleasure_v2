<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<script>
	$(
			function(){
				$("#btnPopup").click(
						function(){
							$("#theModal").modal();
						}
					);
			}
	);
</script>
<title>배틀 대기방</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.jsp"/>
<br>
<h2><center>배틀 대기방</center></h2>
<br><br><br>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>퀴즈 유형</th>
				<th>문제 개수</th>
				<th>포인트</th>
				<th>생성자</th>
				<th>인원수</th>
				<th>게임상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>01</td>
				<td>덤벼라멍청아</td>
				<td>연예</td>
				<td>10</td>
				<td>1000</td>
				<td>TEST05</td>
				<td>1/2</td>
				<td>대기</td>
			</tr>
		</tbody>
	</table>
	<hr />
	<div class="col-md-12 portfolio-item" align="right">
		<a class="btn btn-default pull-right" href="#makeRoom" data-toggle="modal" id="btnPopup">방만들기</a>
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
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>생각없는 퀴즈사이트 입니다.</h3>
							</div>
							<div class="modal-body">
								<p>문제를 공유하고 남들이 출제한 문제를 풀어</p>
								<p>랭킹에 도전하세요</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
       							<button type="button" class="btn btn-primary">만들기</button>
							</div>
						</div>
					</div>
 </div>
 <!-- 방만들기 모달 종료-->   
</body>
</html>