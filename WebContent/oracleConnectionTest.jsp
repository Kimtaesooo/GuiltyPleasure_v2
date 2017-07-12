<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dbcp.DBConnectionMgr"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 오라클 연결 테스트</h1>
<%
	try{
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
		Connection con = pool.getConnection();		
		
		if(con != null){
			System.out.println("연결 성공");
			out.println("연결 성공");
		}
		pool.freeConnection(con);
	}
	catch(Exception err){
		System.out.println("연결 실패 : " + err);
	}
	finally{
		
	}

%>

</body>
</html>