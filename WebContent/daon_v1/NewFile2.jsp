<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상점</title>
<link rel="stylesheet" href="../bootstrap332/css/bootstrap.min.css">
<script src="../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../bootstrap332/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$("a[role='explain']").click(function() {
			$("#explainModal").modal();
		});
	
		$("a[role='update']").click(function() {
			$("#updateModal").modal();
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.shopmodule.ShopManager"></jsp:useBean>
<%
	
	List list=dao.getItemList();
	
	//페이징 기능 추가
	int totalRecord = list.size();
	int numPerPage = 5;
	int totalPage = 0;
	int nowPage = 0;
	int beginPerPage = 0;
	
	totalPage =(int)Math.ceil((double)totalRecord/numPerPage);
	
	if(request.getParameter("nowPage")!=null)
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	

	
%>
	<br>
	<h2>상점</h2>
	<hr>
	<br>
	<br>
	<br>
	
	<div class="row" align="center">
		<div class="col-md-1">
			<a href="" class="control left" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
		</div>
		<div class="col-md-10">
			<table border="1" cellspacing=0 cellpadding=0>
				<tr>
	<%
		
	
			for(int i=beginPerPage; i<numPerPage+beginPerPage;i++){
				if(i == totalRecord)
					break;
				Shop dto = (Shop)list.get(i);
				
				
	%>
	
	
					<td width="300"><img class="img-responsive" width="100"
						height="100" src="img/victory.png" alt="" align="left"> <b><%=dto.getS_itemname()%></b><br>500원<br>남은수량:-<br> <br>
						<p>
							<a href="#" class="btn btn-primary btn-sm" role="button">구매</a> <a
								href="#" class="btn btn-default btn-sm" role="explain">설명</a><a
								href="#" class="glyphicon glyphicon-cog"  role="update"></a>
						</p></td>
					
<%
			}
%>
				</tr>
			</table>
		</div>
		<div class="col-md-1">
			<a href="" class="control right" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
		</div>
	</div>
	
	<!-- 설명 버튼 모달 --> 
	 <div class="modal fade" id="explainModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>아이템</h3>
							</div>
							<div class="modal-body">
								<p>얼만데</p>
								<p>좋다</p>
							</div>
							<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     					   <button type="button" class="btn btn-primary">구매</button>
							</div>
						</div>
					</div>
 	</div>
 	
 	<!-- 관리 버튼 모달 --> 
 		 <div class="modal fade" id="updateModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>아이템</h3>
							</div>
							<div class="modal-body">
								<p>살래?</p>
								<p>좋다</p>
							</div>
							<div class="modal-footer">
     					   <button type="button" class="btn btn-primary">수정</button>
     					   <button type="button" class="btn btn-primary">삭제</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
 	</div>
 
</body>
</html>