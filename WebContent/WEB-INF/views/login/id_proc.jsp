<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kor">
<!-- 아이디 찾기 프로세서 -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Search ID/PW</title>

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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/design/login/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/design/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/design/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/design/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/design/assets/ico/apple-touch-icon-57-precomposed.png">
		
    </head>
	
    <body>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>GuiltyPleasure</strong> 아이디 찾기</h1>
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
                        			<h3>아이디 찾기</h3>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/GuiltyPleasure/logcheck?cmd=idpwpage" method="post" class="login-form">
								<c:if test="${rightId eq 'success'}">
									<h4>회원님의 아이디는 </h4><h3>${id} 입니다.</h3>
								</c:if>
								<c:if test="${rightId eq 'failed'}">
									<h3>${id}</h3>
								</c:if>
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
        <script src="${pageContext.request.contextPath}/design/assets/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/design/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/design/assets/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath}/design/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>