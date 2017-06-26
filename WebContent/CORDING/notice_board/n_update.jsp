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
function check(){
	if(document.que.title.value == ""){
		alert("제목을 입력해주세요.");
		document.que.title.focus();
		return;
	}

	if(document.que.content.value == ""){
		alert("내용을 입력해주세요.");
		document.que.content.focus();
		return;
	}
	document.que.submit();
}
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
			<%if(session.getAttribute("u_id")!=null&&session.getAttribute("u_id").equals("master")){%>
			<div class="col-lg-12 panel panel-success">
				<br>
				<div class="jumbotron">
	  			<h1>공지사항 작성</h1>
				</div>
				<br>
				<div class="jumbotron">
				<form action="n_ques_proc.jsp" method="post" name="que">
				<div class="form-group">
				<label class="control-label" >제목</label>
				<input class="form-control"  type="text" name="title" >
				<br>	
				<label class="control-label" >중요도</label>
				<select class="form-control" id="type" name="type">
		          <option>중요함</option>
		          <option>덜중요함</option>
		        </select>
		        <br>
		        <label class="control-label" >내용</label>
		        <textarea class="form-control" rows="10" id="content" name="content"></textarea>
		        </div>
		        <a href="javascript:check()" class="btn btn-primary">글쓰기</a>
		        <button type="reset" class="btn btn-default">다시작성</button>	 
		        </form>
		        </div>
		        
			</div>
			<%}else{ %>
				<div class="col-lg-12 panel panel-success">
				<br>
					<div class="jumbotron">
		  			<h2>관리자만 이용가능한 서비스 입니다.</h2>
					</div>
				</div>
			<%} %>
        </div>
</div>
</body>
</html>