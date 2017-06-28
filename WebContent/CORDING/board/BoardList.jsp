<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.boardmodule.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/style.css">
<style>
.table-hover>tbody>tr:hover {
	background-color: #EEEEEE
}


</style>
<script>
	function check() {
		if (document.search.keyword.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyword.focus();
			return;
		}
		document.search.submit();
	}

	function fnRead(b_num) {
		document.frmRead.b_num.value = b_num;
		document.frmRead.submit();
	}
</script>
</head>
<body>
<jsp:include page="/top.jsp" />
<jsp:include page="/nav.jsp" />
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<%
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		String reload = request.getParameter("reload");

		List list = dao.getBoardList(keyword, keyfield);

		// 페이징 기능 추가
		int totalRecord = list.size(); //전체 글의 개수
		int numPerPage = 10; //한 페이지 당 보여질 글의 개수
		int totalPage = 0;
		int nowPage = 0; //현재 내가 선택한(보고 있는) 페이지 번호
		int beginPerPage = 0; //각 페이지당 시작번호
		int pagePerBlock = 3; //한 블럭당 묶을 페이지수
		int totalBlock = 0; // 현재 블럭 번호
		int nowBlock = 0; // 페이지당 시작 번호, 똑같은 글이 중복되서 보여주는 것을 방지

		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//정수 - > 실수 -> 정수형으로 변환

		if (request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));

		if (request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

		beginPerPage = nowPage * numPerPage;
%>
<div class="row">
	<div style="padding-top:0px; height:90px; background-color: #4fd2c2">
		<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
			<h2 class="fh5co-lead animate-single product-animate-1 fadeIn animated">자유 게시판</h2>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
					<table align=center border=0 width=100%>
						<tr>
							<td align=left>Total : <%=list.size()%> ( <font color=red>
									<%=nowPage + 1%> / <%=totalPage%> pages
							</font>)
							</td>
						</tr>
					</table>
				</div>
			<div class="col-md-4"></div>
			<div class="col-md-4"></div>
		</div>
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<td width="73">번호</td>
						<td width="379">제목</td>
						<td width="73">작성자</td>
						<td width="164">작성일</td>
						<td width="58">조회수</td>
					</tr>
				</thead>
				<%
					if (list.size() == 0) {
				%>
				<tbody>
					<tr height="25" align="center">
						<td></td>
						<td>데이터가 없습니다.</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
				<%
					} else {
						for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
							if (i == totalRecord)
								break;
							Board board = (Board) list.get(i);
				%>
				<tbody>
					<tr height="25" align="center">
						<td><%=i + 1%></td>
						<td><a href="javascript:fnRead('<%=board.getB_num()%>')"><%=board.getB_title()%></a></td>
						<td><%=board.getU_nickname()%></td>
						<td><%=board.getB_regdate()%></td>
						<td><%=board.getB_count()%></td>
					</tr>
				</tbody>
				<%
					}
					}
					%>
			</table>
			<div class="row">
				<div class="col-md-2">
					<%
							if (nowBlock > 0) {
					%>
					<a href="BoardList.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=pagePerBlock*(nowBlock-1)%>">이전<%=pagePerBlock%>개</a>
					<%}%>:::
					<%
 					for (int i = 0; i < pagePerBlock; i++) {
 						if ((nowBlock * pagePerBlock) + i == totalPage)
 							break;
 					%>
					<a href="BoardList.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>"><%=(nowBlock*pagePerBlock)+i+1%></a>&nbsp;
					<%}%>:::
					<%
						if (totalBlock > nowBlock + 1) {
					%>
					<a href="BoardList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=pagePerBlock*(nowBlock+1)%>">다음<%=pagePerBlock%>개</a>
					<%}%>
				</div>
				<div class="col-md-7"></div>
				<div class="col-md-3" align="right">
					<%
						if (session.getAttribute("u_id") != null) {
					%>
					<button type="button" class="btn btn-primary" onclick="window.location='BoardWrite.jsp'">글쓰기</button>
					<%}%>
					<button type="button" class="btn btn-default" onclick="window.location='BoardList.jsp'">목록</button>
				</div>
			</div>
		</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form action="BoardList.jsp" name="search" method="post">
					<div class="form-group">
						<div class="col-xs-4">
							<select class="form-control" name="keyfield">
								<option value="u_nickname"
									<%if (keyfield != null && keyfield.equals("u_nickname")) {%>
									selected="selected" <%}%>>작성자
								<option value="b_title"
									<%if (keyfield != null && keyfield.equals("b_title")) {%>
									selected="selected" <%}%>>제목
								<option value="b_content"
									<%if (keyfield != null && keyfield.equals("b_content")) {%>
									selected="selected" <%}%>>내용
							</select>
						</div>
						<input type="hidden" name="page" value="0">
						<div class="input-group">
							<input type="search" name="keyword" class="form-control"
								<%if ("null".equals(keyword) || keyword == null) {keyword = "";}%>
								value=<%=keyword%>>
							<div class="input-group-btn">
								<button class="btn btn-info" onClick="check()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		<div class="col-md-2" align="right"></div>
	<div class="col-md-2"></div>
</div>
	<form name="frmRead" method="post" action="BoardRead.jsp">
		<input type="hidden" name="b_num" /> <input type="hidden" name="keyfield" value="<%=keyfield%>" /> 
		<input type="hidden" name="keyword" value="<%=keyword %>" />
	</form>
</body>
</html>