<%@page import="dto.c_board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:useBean id="dao" class="dao.customermodule.customer"/>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String id ="";
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	if(keyWord==null){
		keyWord="";
	}
	if(session.getAttribute("u_id")!=null){
		id = (String)session.getAttribute("u_id");
	}
	
	List list = dao.getBoardList(id,keyField,keyWord);
	//페이징
	int totalRecord = list.size();
	int numPerPage = 10;
	int totalPage = 0;
	int nowPage = 0;
	int beginPerPage = 0;
	int pagePerBlock = 3;
	int totalBlock = 0;
	int nowBlock = 0;
	
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	if(request.getParameter("nowBlock")!=null)
		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	
	beginPerPage = nowPage * numPerPage;
%>


<title>Main</title>
</head>
<script>
function check(){
	if(document.search.keyWord.value == ""){
		alert("검색어를 입력하세요.");
		document.search.keyWord.focus();
		return;
	}
	document.search.submit();
}
function fnRead(sc_num){
	document.frmRead.sc_num.value = sc_num;
	document.frmRead.submit();
}
$(document).ready(function(){
	$("#list").css("background","lightblue");
	$("#page").css("background","lightblue");

});
</script>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
<!-- Owl Carousel -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
<!-- toCount -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
<!-- Main JS -->
<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
<!-- Simple Line Icons-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
<!-- Salvattore -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
<!-- Theme Style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- nav바 수정부분 -->	
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<body>
<jsp:include page="/test_nav.jsp"/>
<br><br><br><br><br>
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
	  			<h2>문의하신 내역 입니다.</h2>
	  			<p>대기상태 항목은 아직 답변해드리지 못한 문의 입니다.</p>
	  			<h4>클릭시 답변이 나타납니다.</h4>
				</div>
				
				<div class="jumbotron">
				<form action="customer_list.jsp" name="search" method="post">
					<table border=0 align=center cellpadding=4 cellspacing=0>
					<tr>
						<td align=center valign=bottom>
							<select name="keyField" size="1">
								<option value="sc_title" 
								<% if(keyField!=null&&keyField.equals("sc_title")){%>
								selected="selected"<%} %>> 제목
								<%if(id.equals("master")){ %>
								<option value="u_id"
								<% if(keyField!=null&&keyField.equals("u_id")){%>
								selected="selected"<%} %>>작성자
								<%} %>
								<option value="sc_state" 
								<% if(keyField!=null&&keyField.equals("sc_state")){%>
								selected="selected"<%} %>> 처리상태
							</select>
				
							<input type="text" size="16" name="keyWord" 
							<% if(keyWord != null){%>value="<%=keyWord %>"<%} %>>
							
							<input type="button" value="찾기" onClick="check()">
							<input type="hidden" name="page" value= "0">
						</td>
					</tr>
					</table>
				</form>
				<table class="table table-striped table-hover " id="list">
				  <thead>
				    <tr>
				      <th width="170">등록일</th>
				      <th width="100">작성자</th>
				      <th>글제목</th>
				      <th width="100">처리상태</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<%
							if(list.size() == 0){
					%>
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
					<% 
							}
							else{
						   for(int i=beginPerPage; i<numPerPage+beginPerPage; i++){
								if(i == totalRecord)
									break;
								
								c_board dto = (c_board)list.get(i);
					%>
							<tr class="info">
								<td><%=dto.getSc_regdate()%></td>
								<td><%=dto.getU_id()%></td>
								<td><a href="javascript:fnRead('<%=dto.getSc_num()%>')"><%=dto.getSc_title()%></a></td>
								<td><%=dto.getSc_state() %></td>
							</tr>
					<% 		}
						}%>
					<tr id="page">
						
						<td  colspan="5" align="center">
							Go to Page
							<% if(nowBlock > 0){%>
								<a href="customer_list.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">이전<%=pagePerBlock%>개</a>
							<% }%> 
							[ 
							<%
								for(int i=0; i<pagePerBlock; i++){
									if((nowBlock*pagePerBlock)+i == totalPage)
										break;
							%>
									<a href="customer_list.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>"><%= (nowBlock*pagePerBlock)+i+1%></a>&nbsp;&nbsp;&nbsp;
							<%
								}
							%>
							] 
							<% if(totalBlock > nowBlock+1){%>
								<a href="customer_list.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">다음<%=pagePerBlock%>개</a>
							<% }%>
								<a href="customer_list.jsp"> 처음으로</a>
						</td>
						
					</tr>
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
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
</form>
</body>
</html>