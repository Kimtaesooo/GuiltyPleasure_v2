<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap332/css/bootstrap.min.css">
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
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
	<!-- Owl Carousel -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/owl.carousel.min.js"></script>
	<!-- toCount -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/jquery.countTo.js"></script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/design/mintstrap/outline/js/main.js"></script>
<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/icomoon.css">
	<!-- Simple Line Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/magnific-popup.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/owl.theme.default.min.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/design/mintstrap/outline/css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
<!-- nav바 수정부분 -->	
<style>
.fh5co-nav-toggle > span {color: #333;}	a {color: #333;}
.navbar-brand {color: #333;}#fh5co-offcanvass .fh5co-lead {font-size: 15px;color: #333;}
.navbar-brand > span {border: 2px solid #333;}
.navbar-brand:hover {color: #3c763d;}
a {color: #333;}
#fh5co-offcanvass {background: #d3d9da;color: #878c93;}
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<body>
<jsp:include page="/test_nav.jsp"/>

<div id="fh5co-main"> 
        <div class="row">
       <div class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
       	<br>
		<h2 class="fh5co-lead to-animate"></h2>
		<br>
		</div>
			<div class="col-md-4 to-animate">
					<a href="${pageContext.request.contextPath}/CORDING/Quiz/SingleStart.jsp" class="fh5co-figure">
						<span class="fh5co-lead">싱글플레이</span>
						<br>
						<img src="https://cdn3.iconfinder.com/data/icons/forall/110/game-128.png">
					</a>
			</div>
           	<div class="col-md-4 to-animate">
					<a href="taesoo_battle/battleRoom.jsp" class="fh5co-figure">
						<span class="fh5co-price">배틀플레이</span>
						<br>
						<img src="https://cdn0.iconfinder.com/data/icons/pokemon-go-vol-1/135/_Battle-128.png">
					</a>
			</div>
      		<div class="col-md-4 to-animate">
					<a href="/GuiltyPleasure/shop?cmd=SHOPLIST" class="fh5co-figure">
						<span class="fh5co-price">상점</span>
						<br>
						<img src="https://cdn3.iconfinder.com/data/icons/shopping-icons-14/128/01_Shopping_Cart-128.png">
					</a>
			</div>
        </div>

        <div class="row">
        	<div class="col-md-4 to-animate">
					<a href="CORDING/custom/customer_main.jsp" class="fh5co-figure">
						<span class="fh5co-price">고객센터</span>
						<br>
						<img src="https://cdn2.iconfinder.com/data/icons/miscellaneous-31/60/birdhouse-128.png">
					</a>
			</div>
			<div class="col-md-4 to-animate">
					<a href="CORDING/rank/rankBattle.jsp" class="fh5co-figure">
						<span class="fh5co-price">랭킹</span>
						<br>
						<img src="https://cdn4.iconfinder.com/data/icons/infographic-bar-pie-chart-vol-5-1/512/5-128.png">
					</a>
			</div>
			<div class="col-md-4 to-animate">
					<a href="CORDING/notice_board/n_list.jsp" class="fh5co-figure">
						<span class="fh5co-price">공지사항</span>
						<br>
						<img src="https://cdn4.iconfinder.com/data/icons/business-finance-vol-12-2/512/24-128.png">
					</a>
			</div>
        </div>

        <div class="row">
	        <div class="col-md-4 to-animate">
					<a href="CORDING/board/BoardList.jsp" class="fh5co-figure">
						<span class="fh5co-price">자유게시판</span>
						<br>
						<img src="https://cdn2.iconfinder.com/data/icons/xomo-basics/128/document-05-128.png">
					</a>
			</div>
			<div class="col-md-4 to-animate">
					<a href="CORDING/QuizRegi/QuizRegInfo.jsp" class="fh5co-figure">
						<span class="fh5co-price">퀴즈등록</span>
						<br>
						<img src="https://cdn0.iconfinder.com/data/icons/office-icon-set-2/100/Noun_Project_100Icon_10px_grid-17-128.png">
					</a>
			</div>
			<div class="col-md-4 to-animate">
					<a href="#theModal" class="fh5co-figure"  data-toggle="modal">
						<span class="fh5co-price">사이트 안내</span>
						<br>
						<img src="https://cdn2.iconfinder.com/data/icons/new-year-s-hand-drawn-basic/64/question_mark-128.png">
					</a>
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