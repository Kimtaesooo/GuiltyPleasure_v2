<%@page import="dto.Reply"%>
<%@page import="java.util.ArrayList"%>
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

	function inputBtn(b_num){
		var reply = document.getElementById("reply").value;
		var form = document.replyform;
		if(reply != null){
			form.submit();
		}
		else{
			alert("내용을 입력해주세요.");
		}
	}
	
	function delBtn(r_reply){
		var delForm = document.delReplyForm;
		delForm.r_reply.value = r_reply;
		delForm.submit();
	}
</script>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />
<jsp:useBean id="dto2" class="dto.Reply" />
<%
	String b_num = request.getParameter("b_num"); 
	String keyfield = request.getParameter("keyfield");
	String keyword = request.getParameter("keyword");
	
	dto = dao.getBoard(b_num,true);

	pageContext.setAttribute("dto", dto);
	
	String sid = (String)session.getAttribute("u_id");
	String u_id = dto.getU_id();
	
	ArrayList<Reply> rep_list = dao.getReplyList(b_num);
	pageContext.setAttribute("list", rep_list);
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
	if(sid.equals(u_id)){
%>
	<input type=button value="수정" OnClick="window.location='BoardUpdate.jsp?b_num=<%=b_num%>'">
	<input type=button value="삭제" OnClick="window.location='BoardDelete_proc.jsp?b_num=<%=b_num%>'">
<%
	}
%>
      <td width="0">&nbsp;</td>
     </tr>
    </table>
  <form name="delReplyForm" method="post" action="ReplyDelete_proc.jsp">
  <input type="hidden" name="r_reply" >
  <input type="hidden" name="b_num" value="<%=b_num %>">
    <table>
<%
	if(rep_list.size()==0){
%>   
 		<tr height="25" align="center">
			<td>데이터가 없습니다.</td>
		</tr>
<%
	}
	else{
		for(int i=0; i<rep_list.size(); i++){
			dto2 = (Reply)rep_list.get(i);
			System.out.println("uid = "+dto2.getU_id());
%>  
    	<tr height="25" align="center">
    		<td><%=dto2.getU_id() %></td>
    		<td><%=dto2.getR_content() %></td>
    		<td><%=dto2.getR_regdate() %></td>
<%
		if(sid.equals(dto2.getU_id())){
%>
			<td><input type="button" name="delReply" value="X" onclick="delBtn('<%=dto2.getR_reply() %>')"></td>
<%
		}
%>    	
 <%
		}
 	}
 %> 
		</tr>
	
</table>
</form>
   <form name="replyform" method="post" action="Reply_proc.jsp"> 
   <input type="hidden" name="b_num" value="<%=b_num %>">
   <input type="hidden" name="u_id" value="<%=sid %>">
    <table>
    	<tr align="center">
    		<td><br></td>
     		<td><textarea id="reply" rows="4" cols="55" name="r_content"></textarea></td>
     	</tr>
     	<tr>
     		<td><input type="button" name="input" value="등록" onclick="inputBtn(b_num)"></td>
     	</tr>
    </table>
   </form> 
   </td>
  </tr>
 </table>
 <form name="frmList" method="post" action="BoardList.jsp">
	<input type="hidden" name="keyfield" value="<%=keyfield %>" />
	<input type="hidden" name="keyword" value="<%=keyword %>" />
</form>
</body>
</html>