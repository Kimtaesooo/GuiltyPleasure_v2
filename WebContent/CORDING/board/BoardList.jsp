<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.boardmodule.*"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자유게시판</title>
<script>
	function check(){
		if(document.search.keyword.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyword.focus();
			return;
		}
		document.search.submit();
	}

	function fnRead(b_num){
		document.frmRead.b_num.value = b_num;
		document.frmRead.submit();
	}
</script>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="dao.boardmodule.FreeBoard" />
<jsp:useBean id="dto" class="dto.Board" />

<%
	String keyfield = request.getParameter("keyfield");
	String keyword = request.getParameter("keyword");
	String reload = request.getParameter("reload");
	
	List list = dao.getBoardList(keyword, keyfield);
	
	// 페이징 기능 추가
   	int totalRecord=list.size(); //전체 글의 개수
   	int numPerPage=5; //한 페이지 당 보여질 글의 개수
   	int totalPage=0;
   	int nowPage=0; //현재 내가 선택한(보고 있는) 페이지 번호
   	int beginPerPage=0; //각 페이지당 시작번호
   	int pagePerBlock=3; //한 블럭당 묶을 페이지수
   	int totalBlock=0;  // 현재 블럭 번호
   	int nowBlock=0; // 페이지당 시작 번호, 똑같은 글이 중복되서 보여주는 것을 방지
   	
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);//정수 - > 실수 -> 정수형으로 변환
    
    if(request.getParameter("nowPage")!= null)
    nowPage = Integer.parseInt(request.getParameter("nowPage"));
       
    if(request.getParameter("nowBlock")!= null)
    nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
    
    totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
    
    beginPerPage =  nowPage * numPerPage;
%>

<table align=center width="80%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(list.size()==0){
%>  
	<tr height="25" align="center">
		<td>데이터가 없습니다.</td>
	</tr>
<%
	}
	else{
		 for(int i=beginPerPage; i<numPerPage+beginPerPage; i++){
             if(i == totalRecord)
                break;
             Board board = (Board)list.get(i);
%>
<tr height="25" align="center">
<td><%=board.getB_num()%></td>
<td><a href="javascript:fnRead('<%=board.getB_num()%>')"><%=board.getB_title()%></a></td>
<td><%=board.getU_nickname()%></td>
<td><%=board.getB_regdate()%></td>
<td><%=board.getB_count()%></td>
</tr>
<%
		 }
}
%>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table align=center width="80%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align=right>
   <td><input type=button value="메인" onclick="window.location='/GuiltyPleasure/main.jsp'"></td>
   <td>
<%
	if(session.getAttribute("u_id") != null){
%>
   <input type=button value="글쓰기" onclick="window.location='BoardWrite.jsp'">
<%
	}
%>   
   &nbsp;<input type=button value="목록" onclick="window.location='BoardList.jsp'">
   </td>
  </tr>
</table>
<br>
<form action="BoardList.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyfield" size="1">
				<option value="u_nickname" <%if(keyfield!=null && keyfield.equals("u_nickname")){%>selected="selected"<%}%>> 작성자
				<option value="b_title" <%if(keyfield!=null && keyfield.equals("b_title")){%>selected="selected"<%}%>> 제목
				<option value="b_content"<%if(keyfield!=null && keyfield.equals("b_content")){%>selected="selected"<%}%>> 내용
			</select>

			<input type="text" size="16" name="keyword" <%if("null".equals(keyword)||keyword==null){keyword="";}%>value=<%=keyword%>>
			<input type="button" value="찾기" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
<form name="frmRead" method="post" action="BoardRead.jsp">
	<input type="hidden" name="b_num"/>
	<input type="hidden" name="keyfield" value="<%=keyfield %>" />
	<input type="hidden" name="keyword" value="<%=keyword %>" />
</form>	
</body>
</html>