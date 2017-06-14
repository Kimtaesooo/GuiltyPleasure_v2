<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cnt" value="0"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상점</title>
<link rel="stylesheet"
	href="/GuiltyPleasure/bootstrap332/css/bootstrap.min.css">
<script src="/GuiltyPleasure/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="/GuiltyPleasure/bootstrap332/js/bootstrap.min.js"></script>

<script>
	jQuery(function() {
		
		/*
		$("a[role='explain']").click(function() {
			$("#explainModal").modal();
		});
		*/	
		var explainButton = $("input.explain");
		var updateButton = $("input.update");
		var buyButton = $("input.buy");
		
		for(i=1; i<=explainButton.length; i++){
			explainModal(i);
		}
		for(i=1; i<=updateButton.length; i++){
			updateModal(i);
		}
		for(i=1; i<=buyButton.length; i++){
			buyModal(i);
		}
		
		
	});
	
	function explainModal(i){
		$("#explainButton" + i).bind("click", function(e) {
			$("#explainModal" + i).modal();
		});
	}
	function updateModal(i){
		$("#updataButton" + i).bind("click", function(e) {
			$("#updateModal" + i).modal();
		});
	}
	function buyModal(i){
		$("#buyButton" + i).bind("click", function(e) {
			$("#buyModal" + i).modal();
		});
	}
</script>
</head>
<body>
	<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.shopmodule.ShopManager"></jsp:useBean>

<c:set var="totalRecord" value="${itemList.size()}"/>
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
			<table border="1" >
				<tr>
					
				
					<c:forEach var="item" items="${itemList}">
						<td width="300"><img class="img-responsive" width="100"
							height="100"
							src="/GuiltyPleasure/daon_v1/img/${item.s_itemcode}.png" alt=""
							align="left"> <b>${item.s_itemname}</b><br>
							${item.s_price}<br> ${item.s_limit_num}<br> <br>
							${totalRecord}
							<p>
								<input type="button" class="buy" id="buyButton${cnt=cnt+1}" value="구매"/>
								<input type="button" class="explain" id="explainButton${cnt}" value="설명"/>
								<input type="button" class="update" id="updataButton${cnt}" value="수정"/>
							</p>
						</td>
						
						<!-- 구매 버튼 모달 -->
						<div class="modal fade" id="buyModal${cnt}" data-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									
										<h3>${item.s_itemname}</h3>
									</div>
									<div class="modal-body">
										<p>${item.s_itemname}살래?</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary">확인</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 설명 버튼 모달 -->
						<div class="modal fade" id="explainModal${cnt}" data-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									
										<h3>${item.s_itemname}</h3>
									
									</div>
									<div class="modal-body">
										<p>${item.s_content}</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary">구매</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 관리 버튼 모달 -->
						<div class="modal fade" id="updateModal${cnt}" data-backdrop="static">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									
										<h3>${item.s_itemname}</h3>
									</div>
									<div class="modal-body">
										<p>수정해보자~</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary">수정</button>
										<button type="button" class="btn btn-primary">삭제</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>


				</tr>
			</table>
		</div>
		<div class="col-md-1">
			<a href="" class="control right" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
		</div>
	</div>

	<!-- 설명 버튼 모달 -->

	<!-- 관리 버튼 모달 -->

</body>
</html>