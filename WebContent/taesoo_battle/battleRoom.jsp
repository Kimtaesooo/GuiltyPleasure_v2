<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@page import="dto.Battle_Room"%>
<%@ page import="dao.playmodule.BattlePlay"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script	src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("#btnPopup").click(function() {
			$("#theModal").modal();
		});
	});
	
	function fnRead(u_id, br_num){
		document.frmRead.u_id.value = u_id;
		document.frmRead.br_num.value = br_num;
		document.frmRead.submit();
	}
</script>


<%
	String gameUser = (String)session.getAttribute("u_id");
	String ip = request.getRemoteAddr();	
	String u_id ="";
	if(session.getAttribute("u_id")!=null){
		u_id = (String)session.getAttribute("u_id");
	}
%>
<title>배틀 대기방</title>
</head>  
<body>
	<jsp:useBean id="dao" class="dao.playmodule.BattlePlay"/>
	<jsp:useBean id="dto" class="dto.Battle_Room"/>
<%
	List list = dao.getListRoom();
%>
	<jsp:include page="/top.jsp" />
	<br>
	<h2>
		<center>배틀 대기방</center>
	</h2>
	<br>
	<br>
	<br>
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
				<%if(list.size() ==0){%>
				<tr>
					<td colspan="8" align="center">현재 대기중인 게임이 없습니다.</td>
				</tr>
				<%}
				else{%>				
				<%for(int i=0; i<list.size(); i++){
					Battle_Room room = (Battle_Room)list.get(i);
				%>
				<tr>
					<td><%=i+1%></td>
					<td><a href="javascript:fnRead('<%=room.getU_id()%>','<%=room.getBr_num()%>')"><%=room.getBr_subject() %></a></td>
					<td><%=room.getBr_type() %></td>
					<td><%=room.getBr_cnt() %></td>
					<td><%=room.getBr_point() %></td>
					<td><%=room.getU_id() %></td>
					<td><%=room.getBr_people() %></td>
					<td><%=room.getBr_gamestate() %></td>
				</tr>
				<%} 
				}%>
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
		<form class="form-horizontal" action="battleCreation.jsp">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3>배틀 방 만들기</h3>
					</div>
					<div class="modal-body">
						<input type="hidden" value="<%=ip%>" name="br_ip">
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
								<input type="text"  class="form-control onlyNumber" name="br_point"
									id="BR_POINT" placeholder="포인트를 입력해주세요">									
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
									<option value="D">안녕</option>
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
<form name="frmRead" method="get" action="playRoom.jsp">
	<input type="hidden" name="u_id"/>
	<input type="hidden" name="br_num"/>
</form>	
<script>
$(".onlyNumber").keyup(function(event){
    if (!(event.keyCode >=37 && event.keyCode<=40)) {
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));
    }
});
</script>
</body>
</html>