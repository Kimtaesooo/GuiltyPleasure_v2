<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>자유게시판-글쓰기</title>
<script>
	function writeCheck() {
		var form = document.writeform;
		if (!form.title.value) {
			alert("제목을 입력해주세요");
			form.title.focus();
			return;
		}

		if (!form.content.value) {
			alert("내용을 입력해주세요");
			form.content.focus();
			return;
		}

		form.submit();
	}
</script>
</head>
<body>
<jsp:include page="/top.jsp" />
<jsp:include page="/nav.jsp" />
	<div class="row">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
				<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
				<td>자유게시판 글 등록</td>
				<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
			</tr>
		</table>
	</div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<form name="writeform" method="post" action="Boardwrite_proc.jsp">
		<table align=center>
			<br>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="4" width="407"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">제 목 &nbsp;&nbsp;</td>
				<td><input class="form-control" name="title" size="50"
					maxlength="100"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">작성자 &nbsp;&nbsp;</td>
				<td><input class="form-control" name="u_id" size="50"
					maxlength="50" value=<%=session.getAttribute("u_id")%>
					readonly="readonly"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">내 용 &nbsp;&nbsp;</td>
				<td><textarea name="content" class="form-control" rows="13"
						cols="50"></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="4"></td>
			</tr>
			<tr align="center">
				<td>&nbsp;</td>
				<td colspan="2"><br>
					<button type="button" class="btn btn-primary"
						onclick="javascript:writeCheck();">등록</button>
					<button type="button" class="btn btn-default"
						onclick="javascript:history.back(-1)">취소</button>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
	</div>
	<div class="col-md-2"></div>
</div>
</body>
</html>