<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 

	ID/PW 찾는 페이지 폼

 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/design/bootstrap332/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/design/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/design/bootstrap332/js/bootstrap.min.js"></script>

<title>Id/Pw Search</title>
</head>
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
<jsp:include page="/top.jsp"/>
<div class="container">
        <div class="row">
        	<h2>아이디 / 비밀번호 찾기</h2><hr>
            <div class="col-lg-12 panel panel-primary" id="id" >
            <h3>아이디 찾기</h3>
            <br>
            <form action="/GuiltyPleasure/logcheck?cmd=logidfind" method="post" class="search-id">
            <div class="form-group">
     		 <label for="inputName" class="col-lg-2 control-label">이름</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="name" name="name" placeholder="이름 입력">
    			  </div>
    		</div>
    		<br><br>
             <div class="form-group">
     		 <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="email" name="email" placeholder="이메일 입력">
    			  </div>
    		</div>
    		<br><br>
    			<div class="form-group">
			      <div class="col-lg-12 col-lg-offset-2">
			        <button type="submit" class="btn btn-primary">확인</button>
			        &nbsp;&nbsp;&nbsp;
			        <button type="reset" class="btn btn-default">취소</button>
			        <br><br>
			      </div>
			    </div>	
			</form>
            </div><!-- 아이디 찾기 -->
            
            <div class="col-lg-12 panel panel-primary" id="pw" >
            <h3>비밀번호 찾기</h3>
            <br>
             <form action="/GuiltyPleasure/logcheck?cmd=logpwfind" method="post" class="search-id">
            <div class="form-group">
     		 <label for="inputId" class="col-lg-2 control-label">아이디</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="inputEmail" name="id" placeholder="아이디 입력">
    			  </div>
    		</div>
    		<br><br>
            <div class="form-group">
     		 <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="inputEmail" name="email" placeholder="이메일 입력">
    			  </div>
    		</div>
    		<br><br>
    		 <div class="form-group">
     		 <label for="inputQuiz" class="col-lg-2 control-label">퀴즈선택</label>
     		 <div class="col-lg-10">
    		 <select class="form-control" id="select" name="select">
    		 <c:forEach items="${u_find}" var="find">
    		 	<option>${find}</option>
    		 </c:forEach>
	         </select>
	        </div>
	      	</div>
	      	<br><br>
	      	<div class="form-group">
     		 <label for="inputAn" class="col-lg-2 control-label">답변</label>
    			  <div class="col-lg-10">
      				  <input type="text" class="form-control" id="inputAn" placeholder="답변 입력" name="answer">
    			  </div>
    		</div>
    		<br><br>
    			<div class="form-group">
			      <div class="col-lg-12 col-lg-offset-2">
			        <button type="submit" class="btn btn-primary">확인</button>
			        &nbsp;&nbsp;&nbsp;
			        <button type="reset" class="btn btn-default">취소</button>
			        <br><br>
			      </div>
			    </div>	
			    </form>
            </div><!-- 패스워드 찾기 -->     
              
	</div>
</div>
</body>
</html>