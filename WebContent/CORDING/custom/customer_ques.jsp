<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>


<script>

</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");

%>
<title>질문</title>
</head>
<body>
<jsp:include page="/top.jsp"/>
<jsp:include page="/nav.jsp"/>

<div class="container">   
        <div class="row col-lg-12">
        	<div class="col-lg-4">
        	<a href="customer_main.jsp" class="btn btn-success">문의</a>
        	<a href="customer_list.jsp" class="btn btn-info">문의 내역</a>
			</div>
			
			<div class="col-lg-8" align="right">
			<a href="#" class="btn btn-warning active" >문의하기</a>	
			</div>
			<br>
			<br>
			<%if(session.getAttribute("u_id")!=null){%>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>문의하기</h1>
	  			<p>자세히 작성해 주셔야 빠르고 정확한 답변이 가능합니다 !</p>
				</div>
				<br>
				<div class="jumbotron">
				<form action="customer_ques_proc.jsp" method="post">
				<div class="form-group">
				<label class="control-label" >제목</label>
				<input class="form-control"  type="text" name="title" >
				<br>	
				<label class="control-label" >분류</label>
				<select class="form-control" id="type" name="type">
		          <option>환불/교환</option>
		          <option>시스템 장애</option>
		          <option>제안</option>
		          <option>싱글플레이</option>
		          <option>배틀플레이</option>
		          <option>상점</option>
		          <option>랭킹</option>
		          <option>퀴즈</option>
		          <option>가입/탈퇴</option>
		          <option>포인트 결제</option>
		          <option>기타</option>
		        </select>
		        <br>
		        <label class="control-label" >내용</label>
		        <textarea class="form-control" rows="10" id="content" name="content"></textarea>
		        </div>
		        <button type="submit" class="btn btn-primary">확인</button>
		        <button type="reset" class="btn btn-default">다시작성</button>	 
		        </form>
		        </div>
		        
			</div>
			<%}else{ %>
				<div class="col-lg-12 panel panel-success">
				<br>
					<div class="jumbotron">
		  			<h2>로그인 후 이용가능한 서비스 입니다.</h2>
		  			<p><a>회원가입</a> 혹은 <a>로그인</a>을 해주세요</p>
					</div>
				</div>
			<%} %>
        </div>
</div>
</body>
</html>