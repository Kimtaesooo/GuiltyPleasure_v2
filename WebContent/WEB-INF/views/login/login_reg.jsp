<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 

	회원 가입을 완료하게 되면 들어오게 되는 폼

 -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Guilty Pleasure Login</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/design/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/design/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/design/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/design/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/design/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/design/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/design/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/design/login/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/design/login/assets/ico/apple-touch-icon-57-precomposed.png">


    </head>

    <body>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>GuiltyPleasure</strong> 로그인</h1>
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
                        			<h3>로그인</h3>
                            		<p>회원가입이 완료되었습니다.</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="lgcheck.jsp" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="form-username" placeholder="아이디" class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="form-password" placeholder="패스워드" class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">로그인</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div>
                        		<br>
	                        	<a href="/GuiltyPleasure/logcheck?cmd=resistrationpage"><font size="4em" color="white">회원가입&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/logcheck?cmd=idpwpage"><font size="4em" color="white">아이디/비밀번호 찾기&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/CORDING/custom/customer_main.jsp"><font size="4em" color="white">고객센터&nbsp;&nbsp;&nbsp;</font></a>
	                        	<a href="/GuiltyPleasure/main.jsp"><font size="4em" color="white">메인&nbsp;&nbsp;&nbsp;</font></a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/design/assets/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/design/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/design/assets/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath}/design/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>
</html>