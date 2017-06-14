<%@page import="dto.c_board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<jsp:useBean id="dao" class="dao.customermodule.customer"/>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String id ="";

	if(session.getAttribute("u_id")!=null){
	id = (String)session.getAttribute("u_id");
	}
	List list = dao.getBoardList(id);
	
%>


<title>Main</title>
</head>
<script>
function fnRead(sc_num){
	document.frmRead.sc_num.value = sc_num;
	document.frmRead.submit();
}
$(document).ready(function(){
	$("table").css("background","lightblue");

});
</script>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.html"/>

<div class="container">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success ">문의</a>
        	<a href="#" class="btn btn-info active">문의 내역</a>
			</div>
			<div class="col-lg-8" align="right">
			<a href="customer_ques.jsp" class="btn btn-warning" >문의하기</a>	
			</div>
			<br><br>
			<div class="col-lg-12 panel panel-success">
				<br>
				<%if(session.getAttribute("u_id")!=null){%>
				<div class="jumbotron">
	  			<h1>문의하신 내역 입니다.</h1>
	  			<p>대기상태 항목은 아직 답변해드리지 못한 문의 입니다.</p>
	  			<h5>클릭시 답변이 나타납니다.</h5>
				</div>
				
				<div class="jumbotron">
				<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th width="200">등록일</th>
				      <th>글제목</th>
				      <th width="100">처리상태</th>
				    </tr>
				  </thead>
				  <tbody>
				   <%
						for(int i=0; i<list.size();i++){
								c_board dto = (c_board)list.get(i);	
					%>			
							<tr class="info">
								<td><%=dto.getSc_regdate()%></td>
								<td><a href="javascript:fnRead('<%=dto.getSc_num()%>')"><%=dto.getSc_title()%></a></td>
								<td><%=dto.getSc_state() %></td>
							</tr>
					<% 		}%>
				  </tbody>
				</table>
				</div>
				<%} else{%>
				
				<br>
					<div class="jumbotron">
		  			<h2>로그인 후 이용가능한 서비스 입니다.</h2>
		  			<p><a>회원가입</a> 혹은 <a>로그인</a>을 해주세요</p>
					</div>
			
				<%} %>
        </div>
	</div>
</div>
<form name="frmRead" method="post" action="customer_read.jsp">
	<input type="hidden" name="sc_num" />
</form>
</body>
</html>