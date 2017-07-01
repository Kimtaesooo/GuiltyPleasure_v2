<%@page import="dto.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/style.css">
<title>자유게시판 글 조회</title>
</head>
<script>
	function LockF5() { 
		if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))|| (event.keyCode == 116)){ 
			event.keyCode = 0; 
			event.cancelBubble = true; 
			event.returnValue = false; 
			}
    } 
	
	function fnList() {
		document.frmList.submit();
	}

	function fnRead2(b_num) {
		document.frmRead2.b_num.value = b_num;
		document.frmRead2.submit();
	}

	function inputBtn(b_num) {
		var reply = document.getElementById("reply").value;
		var form = document.replyform;
		if (reply.length>0) {
			form.submit();
		} else {
			alert("내용을 입력해주세요.");
		}
	}

	function delBtn(r_reply) {
		var delForm = document.delReplyForm;
		delForm.r_reply.value = r_reply;
		delForm.submit();
	}
</script>
<body onkeydown="LockF5()">
	<jsp:include page="/top.jsp" />
	<jsp:include page="/nav.jsp" />
	<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
	<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
	<jsp:useBean id="dto" class="dto.Board" />
	<jsp:useBean id="dto2" class="dto.Reply" />
	<%
		//write -> read / list -> read
		String b_num = request.getParameter("b_num")==null?request.getAttribute("writeRead").toString():request.getParameter("b_num");
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		dto = dao.getBoard(b_num, true);
		
		String sid = (String) session.getAttribute("u_id");
		pageContext.setAttribute("dto", dto);
		
		String u_id = dto.getU_id();

		if(sid.equals(u_id)){
			dao.minusCount(b_num);
		}
	
		ArrayList<Reply> rep_list = dao.getReplyList(b_num);
		pageContext.setAttribute("list", rep_list);
%>
	<div class="row">
	<div style="padding-top:0px; height:90px; background-color: #4fd2c2">
		<div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
			<h2 class="fh5co-lead animate-single product-animate-1 fadeIn animated">보기</h2>
		</div>
	</div>
</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align=center>
			<table class="table table-condensed">
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="left" width="80">작성자</td>
					<td width="400"><jsp:getProperty property="u_nickname" name="dto" /></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="left" width="76">조회수</td>
					<td width="319"><jsp:getProperty property="b_count" name="dto" /></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="left" width="76">작성일</td>
					<td width="319"><jsp:getProperty property="b_regdate" name="dto" /></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td align="left" width="76">제 &nbsp;목</td>
					<td width="319"><jsp:getProperty property="b_title" name="dto" /></td>
					<td width="0">&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
					<td width="0">&nbsp;</td>
					<td width="399" colspan="2" height="200"><jsp:getProperty property="b_content" name="dto" /></td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4" width="407"></td>
				</tr>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
			<div class="col-md-8" align=center>
			<div class="col-md-10" align="left">
				<br>
			<button type="button" class="btn btn-default" onclick="fnList()">목록</button>
			</div>
			<div class="col-md-1" align="center">
			<br>
			<%
				if (sid.equals(u_id)) {
 			%>
 			<form method="post" action="/GuiltyPleasure/Board">
 				<input type="hidden" name="cmd" value="BOARDUPDATE"/>
 				<input type="hidden" name="b_num" id="b_num" value="<%=b_num%>"/>
					<button type="submit" class="btn btn-primary">수정</button>
			</form>
			</div>
			<div class="col-md-1" align="left">
			<br>
			<form method="post" action="/GuiltyPleasure/Board">
				<input type="hidden" name="cmd" value="BOARDDELETE"/>
				<input type="hidden" name="b_num" id="b_num" value="<%=b_num%>"/>
					<button type="submit" class="btn btn-primary">삭제</button>
			</form>
			<%}%>
			</div>
			<br>
			</div>
		<div class="col-md-2"></div>
		</div>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<form name="delReplyForm" method="post" action="/GuiltyPleasure/Board">
				<input type="hidden" name="cmd" value="BOARDREPLYDELETE"/>
				<input type="hidden" name="r_reply"> 
				<input type="hidden" name="b_num" value="<%=b_num%>">
				<table>
					<%
							if (rep_list.size() == 0) {
					%>
					<tr height="25" align="center">
						<td></td>
						<td></td>
						<td>댓글을 등록해주세요.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%
							} else {
								for (int i = 0; i < rep_list.size(); i++) {
										dto2 = (Reply) rep_list.get(i);
					%>
					<tr height="25" align="center">
						<td><%=dto2.getU_id()%></td>
						<td>&nbsp;&nbsp;</td>
						<td><%=dto2.getR_content()%></td>
						<td>&nbsp;&nbsp;</td>
						<td><%=dto2.getR_regdate()%></td>
						<%
								if (sid.equals(dto2.getU_id())) {
						%>
						<td>&nbsp;</td>
						<td>
							<button type="button" name="delReply" class="btn btn-default"
								onclick="delBtn('<%=dto2.getR_reply()%>')">X</button>
						</td>
						<%
								}
								}
							}
						%>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<form name="replyform" method="post" action="/GuiltyPleasure/Board">
				<input type="hidden" name="cmd" value="BOARDREPLY"/>
				<input type="hidden" name="b_num" value="<%=b_num%>"> 
				<input type="hidden" name="u_id" value="<%=sid%>">
				<table>
					<tr align="center">
						<td></td>
						<td><textarea id="reply" name="r_content"
								class="form-control" rows="1" cols="50" maxlength="45"></textarea>
						</td>
						<td>&nbsp;</td>
						<td>
							<button type="button" name="input" class="btn btn-primary"
								onclick="inputBtn(b_num)">등록</button>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table align="center" width="800">
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<tr>
				<%
 					if(dto.getPrevnum() != null){
                %>
					<td align="center">이전 글</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><a href="javascript:fnRead2('<%=dto.getPrevnum()%>')"><%=dto.getPrevtitle()%></a></td>
				<%}%>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
				<%
					if(dto.getNextnum() != null){
				%>
				<tr>
					<td align="center">다음 글</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td><a href="javascript:fnRead2('<%=dto.getNextnum()%>')"><%=dto.getNexttitle()%></a></td>
				<%}%>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4" width="407"></td>
				</tr>
			</table>
			<br><br>
		</div>
		<div class="col-md-2"></div>
	</div>
	<form name="frmList" method="post" action="/GuiltyPleasure/Board">
		<input type="hidden" name="cmd" value="BOARDLIST"/>
		<input type="hidden" name="keyfield" value="<%=keyfield %>" /> 
		<input type="hidden" name="keyword" value="<%=keyword %>" />
	</form>
	<form name="frmRead2" method="post" action="/GuiltyPleasure/Board">
		<input type="hidden" name="cmd" value="BOARDREAD"/>
		<input type="hidden" name="b_num" />
	</form>
</body>
</html>