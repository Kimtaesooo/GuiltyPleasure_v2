<%@page import="dto.U_Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function qinform(id){
		location.href="/GuiltyPleasure/borad?cmd=QREGI_BOARD_GET&id="+id;
	}
</script>
<%
	ArrayList list = (ArrayList)request.getAttribute("Boardlist");
%>
<jsp:useBean id="uq" class="dto.U_Quiz"></jsp:useBean>
<body>
<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=1 width=70% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td> 번호 </td>
				<td width="60%"> 문제 </td>
				<td > 처리상태 </td>
			</tr>
			<%
				if(list.size()==0){
					%>
						<tr>
					<td colspan="5" align="center">등록한 문제가 없습니다</td>
						</tr>
					<%
				}else{
					for(int i =0; i<list.size(); i++){
						uq = (U_Quiz)list.get(i);
					%>
						<tr align="center" onclick="qinform(<%=uq.getUq_num()%>)">
							<td>uq.getUq_num()</td>
							<td>uq.getUq_question()</td>
							<td>uq.getUq_adopt()</td>
						<tr>
					<%
					}
				}
			%>
	
		</table>
	</td>
</tr>
</table>
<form method="posr" action = "QuizReg.jsp">
<input type ="submit" value="문제 제출">
</form>
</body>
</html>