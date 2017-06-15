<%@page import="dto.Board"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자유게시판 글 조회</title>
</head>
<script>
	function fnList(){
		document.frmList.submit();
	}
</script>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<%
	String b_num = (String)request.getParameter("b_num"); 
	String keyfield = request.getParameter("keyfield");
	String keyword = request.getParameter("keyword");
	dto = dao.getBoard(b_num,true);
	pageContext.setAttribute("dto", dto);
	
	//String sid = (String)session.getAttribute("u_id");
	String u_id = dto.getU_id();
	
%>
<table align=center>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>자유게시판</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">번 호</td>
      <td width="319"><jsp:getProperty property="b_num" name="dto"/></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><jsp:getProperty property="b_count" name="dto"/></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성자</td>
      <td width="319"><jsp:getProperty property="u_nickname" name="dto"/></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><jsp:getProperty property="b_regdate" name="dto"/></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제 목</td>
      <td width="319"><jsp:getProperty property="b_title" name="dto"/></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0">&nbsp;</td>
                   <td width="399" colspan="2" height="200"><jsp:getProperty property="b_content" name="dto"/></td>
                </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399">
	<input type=button value="목록" onclick="fnList()">
<%
	if(session.getAttribute("u_id").equals(u_id)){
%>
	<input type=button value="수정" OnClick="window.location='BoardUpdate.jsp?b_num=<%=b_num%>'">
	<input type=button value="삭제" OnClick="window.location='BoardDelete_proc.jsp?b_num=<%=b_num%>'">
<%
	}
%>
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 <form name="frmList" method="post" action="BoardList.jsp">
	<input type="hidden" name="keyfield" value="<%=keyfield %>" />
	<input type="hidden" name="keyword" value="<%=keyword %>" />
</form>
</body>
</html>