<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%//페이징기능 추가
	List list=dao.getItemList();
	int totalRecord = list.size();
	int numPerPage = 4;
	int totalPage = 0;
	int nowPage = 0;
	int beginPerPage = 0;
	int pagePerBlock = 3;
	int totalBlock = 0;
	int nowBlock = 0;
	
	totalPage =(int)Math.ceil((double)totalRecord/numPerPage);
	
	if(request.getParameter("nowPage")!=null)
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock")!=null)
	nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	
	beginPerPage = nowPage*numPerPage;
%>
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
					
					
					<%
		if(list.size()==0){
	%>
			<tr>
				<td colspan="5" align="center">데이터가 없습니다.</td>
			</tr>
	
	<%
		}
		else{
			for(int i=beginPerPage; i<numPerPage+beginPerPage;i++){
				if(i == totalRecord)
					break;
				Shop item= (Shop)list.get(i);
				
	%>
						<td width="300"><img class="img-responsive" width="90"
							height="90"
							src="/GuiltyPleasure/daon_v1/img/<%=item.getS_itemcode()%>.png" alt=""
							align="left"> <b><%=item.getS_itemname()%></b><br>
							<%=item.getS_price()%><br> <%=item.getS_limit_num()%><br> <br>
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
									
										<h3><%=item.getS_itemname()%></h3>
									</div>
									<div class="modal-body">
										<p><%=item.getS_itemname()%>살래?</p>
									</div>
									<div class="modal-footer">
									<form method="post">
										<input type="submit" value="확인" onclick="location.href='/GuiltyPleasure/shop?cmd=SHOPBUY'">
										<input type="hidden" name="code" value="<%=item.getS_itemcode()%>">
									</form>
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
									
										<h3><%=item.getS_itemname()%></h3>
									
									</div>
									<div class="modal-body">
										<p><%=item.getS_content()%></p>
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
									
										<h3><%=item.getS_itemname()%></h3>
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
				
	<%
			}
		}
	%>

				</tr>
			</table>
		</div>
		<div class="col-md-1">
	<%
			if(nowPage<totalPage){
	%>
	
			<a href="shop.jsp?nowPage=<%=nowPage+1%>" class="control right" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
		
	<%
		}
	%>
		</div>
	</div>
	<div align="center">
	<font color=gray>  <%=nowPage+1 %> / <%=totalPage %> Pages </font>
	</div>


</body>
</html>