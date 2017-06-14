<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap332/js/bootstrap.min.js"></script>

<script>
	$(
			function(){
				$("#btnPopup").click(
						function(){
							$("#theModal").modal();
						}
						);
			}
	);
</script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String u_id ="";
	if(session.getAttribute("u_id")!=null){
		u_id = (String)session.getAttribute("u_id");
	}
%>
<title>Main</title>
</head>
<body>
<jsp:include page="/top.jsp"/>

<div class="container">   
        <div class="row">
            <div class="col-lg-12" align="center">
                <h1 class="page-header">Guilty Pleasure
                 
                </h1>
              <div class="alert alert-dismissible alert-warning">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <h4>주의 !!</h4>
				  <p>아무생각 없고 도움도 안되는 퀴즈를 푸는 사이트 입니다.. 똑똑해 지고 싶어 들어 왔다면 돌아가 주세요 :(</p>
				</div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 portfolio-item"  align="center">
                <a href="#">
                    <img class="img-responsive" src="https://cdn3.iconfinder.com/data/icons/forall/110/game-128.png" alt="">
                </a>
                <h3>
                    <a href="#">싱글플레이</a>
                </h3>
             	<br><br><br>
            </div>
            <div class="col-md-4 portfolio-item"  align="center">
                <a href="#">
                    <img class="img-responsive" src="https://cdn0.iconfinder.com/data/icons/pokemon-go-vol-1/135/_Battle-128.png" alt="">
                </a>
                <h3>
                    <a href="#">배틀플레이</a>
                </h3>
               
            </div>
            <div class="col-md-4 portfolio-item"  align="center">
                <a href="#">
                    <img class="img-responsive" src="https://cdn3.iconfinder.com/data/icons/shopping-icons-14/128/01_Shopping_Cart-128.png" alt="">
                </a>
                <h3>
                    <a href="#">상점</a>
                </h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 portfolio-item" align="center">
                <a href="CORDING/custom/customer_main.jsp">
                    <img class="img-responsive" src="https://cdn2.iconfinder.com/data/icons/miscellaneous-31/60/birdhouse-128.png" alt="">
                </a>
                <h3>
                    <a href="CORDING/custom/customer_main.jsp">고객센터</a>
                </h3>
              	<br><br><br>
            </div>
            <div class="col-md-4 portfolio-item" align="center">
                <a href="CORDING/rank/rankBattle.jsp">
                    <img class="img-responsive" src="https://cdn4.iconfinder.com/data/icons/infographic-bar-pie-chart-vol-5-1/512/5-128.png" alt="">
                </a>
                <h3>
                    <a href="CORDING/rank/rankBattle.jsp">랭킹</a>
                </h3>
               
            </div>
            <div class="col-md-4 portfolio-item" align="center">
                <a href="#">
                    <img class="img-responsive" src="https://cdn4.iconfinder.com/data/icons/business-finance-vol-12-2/512/24-128.png" alt="">
                </a>
                <h3>
                    <a href="#">공지사항</a>
                </h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 portfolio-item" align="center">
                <a href="#">
                    <img class="img-responsive" src="https://cdn2.iconfinder.com/data/icons/xomo-basics/128/document-05-128.png" alt="">
                </a>
                <h3>
                    <a href="#">자유게시판</a>
                </h3>

            </div>
            <div class="col-md-4 portfolio-item" align="center">
                <a href="#">
                    <img class="img-responsive" src="https://cdn0.iconfinder.com/data/icons/office-icon-set-2/100/Noun_Project_100Icon_10px_grid-17-128.png" alt="">
                </a>
                <h3>
                    <a href="#">퀴즈등록</a>
                </h3>
    
            </div>
            <div class="col-md-4 portfolio-item" align="center">
                <a href="#theModal" data-toggle="modal">
                    <img class="img-responsive" src="https://cdn2.iconfinder.com/data/icons/new-year-s-hand-drawn-basic/64/question_mark-128.png" alt="">
                </a>
                <h3>
                    <a href="#theModal" data-toggle="modal">사이트 안내</a> 
                </h3>
             
            </div>
        </div>

        <hr>


        <footer>
            <div class="row">
                <div class="col-md-12">
                    <p>Copyright &copy; Guilty Pleasure</p>
                </div>
            </div>

        </footer>

    </div>
    
 <div class="modal fade" id="theModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3>생각없는 퀴즈사이트 입니다.</h3>
							</div>
							<div class="modal-body">
								<p>문제를 공유하고 남들이 출제한 문제를 풀어</p>
								<p>랭킹에 도전하세요</p>
							</div>
							<div class="modal-footer">
							<button class="btn btn-primary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
 </div><!-- 모달 -->   
</body>
</html>