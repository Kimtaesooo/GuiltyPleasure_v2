<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

    <head>
 <!-- 
 
 	비밀번호 찾은 후 결과 폼
 
 
  -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Search ID/PW</title>
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/css/form-elements.css">
        <link rel="stylesheet" href="/GuiltyPleasure/CORDING/login/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="/GuiltyPleasure/CORDING/login/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/GuiltyPleasure/CORDING/login/assets/ico/apple-touch-icon-57-precomposed.png">
		<jsp:useBean id="search" class="dao.loginmodule.idpw"/>
		<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
		String rightPw = (String)request.getAttribute("rightPw"); // DB에서 조회한 패스워드
		String pw = (String)request.getAttribute("pw"); // 유저가 입력한 비밀번호
		
		
		%>
    </head>
	
    <body>
    	
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>GuiltyPleasure</strong> 비밀번호 찾기</h1>
                            <div class="description">
                            	<p>                           
	                            	저희 Guilty Pleasure 페이지에 오신것을 환영합니다.<br> 아무런 도움이 안되는 퀴즈를 풀며 시간을 낭비해보세요.
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>비밀번호 찾기</h3>
                        		</div>
                            </div>
                            <div class="form-bottom">
                            <!-- 유저가 입력한 비밀번호가 맞다면 login.html로 이동 -->
                            <%if(rightPw.equals("success")){ %>
			                    <form role="form" action="/GuiltyPleasure/CORDING/login/login.html" method="post" class="login-form">
			                <!-- 유저가 입력한 비밀번호가 틀리다면 idpw.jsp로 이동-->
			                 <%}else{ %>
			                    <form role="form" action="/GuiltyPleasure/CORDING/login/idpw.jsp" method="post" class="login-form">
			                  <%} %>
			                 
<%
								if(rightPw.equals("success")){ // 유저가 입력한 비밀번호가 맞으면 비밀번호를 알려준다.
%>									
									<h4>회원님의 비밀번호는 </h4> <h3><%=pw%> 입니다.</h3>
<%
								}else{
%>
									<h3><%=pw%></h3>
<%
								}
%>
									<br>
									
			                        <button type="submit" class="btn">돌아가기</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div>
                        		<br>
	                        	<a href="resistration.html"><font size="4em" color="white">회원가입&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="idpw.jsp"><font size="4em" color="white">아이디/비밀번호 찾기&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/CORDING/custom/customer_main.jsp"><font size="4em" color="white">고객센터</font></a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="/GuiltyPleasure/CORDING/login/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/GuiltyPleasure/CORDING/login/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/GuiltyPleasure/CORDING/login/assets/js/jquery.backstretch.min.js"></script>
        <script src="/GuiltyPleasure/CORDING/login/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>