<%@page import="dto.Board"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자유게시판 글 수정</title>
<script>
	var form;
	function check(){
		 form = document.updateform;
		if(!form.b_title.value){
			alert( "제목을 적어주세요" );
			form.b_title.focus();
			return;
		}
				
		if(!form.b_content.value){
			alert( "내용을 적어주세요" );
			form.b_content.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/top.jsp" />
	<jsp:include page="/nav.jsp" />
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<% 
	String b_num = request.getParameter("b_num");
	dto = dao.getBoard(b_num, false);
	
	String sid = (String)session.getAttribute("u_id");
%>
<form name="updateform" method="post" action="BoardUpdate_proc.jsp">
<input type="hidden" name="b_num" value="<%=b_num%>"/>
<table align=center>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>자유게시판 글 수정</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
   <br>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center"> 제 목 &nbsp;&nbsp;</td>
      <td><input class="form-control" name="b_title" size="50" maxlength="100" value="<%=dto.getB_title()%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center"> 작성자 &nbsp;&nbsp;</td>
      <td><input class="form-control" name="id" size="50" maxlength="50" value="<%=sid%>" readonly="readonly">
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center"> 내 용 &nbsp;&nbsp;</td>
      <td><textarea name="b_content" class="form-control" rows="13" cols="50"><%=dto.getB_content()%></textarea>
      </td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><br>
      	<button type="button" class="btn btn-primary" onclick="check()">수정</button>
       	<button type="button" class="btn btn-primary" onclick="javascript:history.back(-1)">취소</button>
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
  </form>
</body>
</html>