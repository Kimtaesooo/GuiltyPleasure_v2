<%@page import="dto.UserInfoDTO"%>
<%@page import="dto.UserInfo"%>
<%@page import="dto.Shop"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cnt" value="0" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Outline &mdash; A Free HTML5 Responsive Template by
	FREEHTML5.CO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Webfonts -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/icomoon.css">
<!-- Simple Line Icons-->
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/simple-line-icons.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/magnific-popup.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/owl.theme.default.min.css">

<!-- Theme Style -->
<link rel="stylesheet"
	href="/GuiltyPleasure/design/mintstrap/outline/css/style.css">
<!-- Modernizr JS -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/GuiltyPleasure/design/mintstrap/outline/js/respond.min.js"></script>
	<![endif]-->

<!-- jQuery -->
<script src="/GuiltyPleasure/design/mintstrap/outline/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/bootstrap.min.js"></script>
<!-- jQuery Easing -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/jquery.easing.1.3.js"></script>

<!-- Waypoints -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/jquery.waypoints.min.js"></script>
<!-- Magnific Popup -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/jquery.magnific-popup.min.js"></script>
<!-- Owl Carousel -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/owl.carousel.min.js"></script>
<!-- toCount -->
<script
	src="/GuiltyPleasure/design/mintstrap/outline/js/jquery.countTo.js"></script>
<!-- Main JS 
	<script src="/GuiltyPleasure/design/mintstrap/outline/js/main.js"></script>
-->
<style>
.navbar-brand {
  text-align: left;
  font-weight: bold;
  display: -moz-inline-stack;
  display: inline-block;
  zoom: 1;
  *display: inline;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 20px;
  float: left !important;
  font-family: "Montserrat", arial, sans-serif;
  color: #000000;
  z-index: 10;
  position: relative;
}

.fh5co-feature, .fh5co-figure {
  display: block;
  color: #444;
  float: left;
  width: 100%;
  text-align: center;
  background: #fff;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  -ms-border-radius: 4px;
  border-radius: 4px;
  padding: 0px 0px;
  -webkit-transition: 0.5s;
  -o-transition: 0.5s;
  transition: 0.5s;
  margin-bottom: 0em;
}

.navbar-brand > span {
    display: -moz-inline-stack;
    display: inline-block;
    zoom: 1;
    float: left;
    border: 2px solid black;
    padding: 7px 10px 7px 12px;
}
</style>

</head>
<body>
	<div id="fh5co-offcanvass">
		<ul>
			<li class="active"><a href="#" data-nav-section="home">Home</a></li>
			<li><a href="#" data-nav-section="features">Features</a></li>
			<li><a href="#" data-nav-section="design">Design</a></li>
			<li><a href="#" data-nav-section="testimonies">Testimonies</a></li>
			<li><a href="#" data-nav-section="products">Products</a></li>
			<li><a href="#" data-nav-section="benefits">Benefits</a></li>
			<li><a href="#" data-nav-section="pricing">Pricing</a></li>
			<li><a href="#" data-nav-section="faqs">FAQs</a></li>
		</ul>
		<h3 class="fh5co-lead">Connect with us</h3>
		<p class="fh5co-social-icons">
			<a href="#"><i class="icon-twitter"></i></a> <a href="#"><i
				class="icon-facebook"></i></a> <a href="#"><i class="icon-instagram"></i></a>
			<a href="#"><i class="icon-dribbble"></i></a> <a href="#"><i
				class="icon-youtube"></i></a>
		</p>
	</div>

	<div id="fh5co-menu" class="navbar">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"
						data-toggle="collapse" data-target="#fh5co-navbar"
						aria-expanded="false" aria-controls="navbar"><span>Menu</span>
						<i></i></a> <a href="index.html" class="navbar-brand"><span>Outline</span></a>
				</div>
			</div>
		</div>
	</div>

	<div id="fh5co-page">
		<div id="fh5co-wrap">
			
			<!-- END .header -->

			<div id="fh5co-main">


				<!-- 상점 페이지 시작 -->

				<br> <br>
				<script>
					

					function explainModal(i) {
							$("#explainModal" + i).modal();
					}
					
					function updateModal(i) {
							$("#updateModal" + i).modal();
					}

					function addModal() {
						
						$("#addModal").modal();
				
					}
					
					function buyModal(i) {
						//유저의 포인트에서 상품의 가격을 뺀 잔액의 크기를 구함
						var leftMoney = document.getElementById("getPoint").value - document.getElementById("getPrice"+ i).value;

						//상품 수량이 없을때 구매 불가능하도록
						if (document.getElementById("getLimit"+ i).value < 1) {
							$("#check").text("재고가 부족합니다ㅠㅠ");
							$("#cantBuyModal").modal();
						} 
						//잔액의 크기가 마이너스일경우 구매불가능하도록
						else {
							if (leftMoney < 0) {
								$("#check").text(-leftMoney+ "원 더 갖고오세요^^");
								$("#cantBuyModal").modal();
							} else {
								$("#buyModal" + i).modal();
							}
						}
					}

					
					
					$(document).ready(function(){
						$('#contents').click(function(){
							$('#popup').hide();
							
						});
					});

				
				</script>
				

	
				<%
					request.setCharacterEncoding("euc-kr");
				%>

				<jsp:useBean id="dao" class="dao.shopmodule.ShopManager"></jsp:useBean>
				<jsp:useBean id="userdao" class="dao.UserInfoDAO"></jsp:useBean>
				<%
					//페이징기능 추가
					List list = dao.getItemList();
					int totalRecord = list.size();
					int numPerPage = 4;
					int totalPage = 0;
					int nowPage = 0;
					int beginPerPage = 0;
					

					totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

					if (request.getParameter("nowPage") != null)
						nowPage = Integer.parseInt(request.getParameter("nowPage"));


					beginPerPage = nowPage * numPerPage;
				%>

				<%
					//세션에서 아이디값 받아 유저의 dto 만들어놓기
					String id = (String) session.getAttribute("u_id");
					UserInfoDTO uDto = userdao.searchUserInfo(id);
				%>



				<!-- 보너스 포인트 적립 팝업 -->
				<%
				
					//포인트 적립 피카츄 기능위해 랜덤좌표 변수
					//5분의 1확률로 띄우기
					int bonusPopup = (int) Math.floor(Math.random() * 5);
					if(bonusPopup==1){
					int topPosition = (int) Math.floor(Math.random() * 1000);
					int leftPosition = (int) Math.floor(Math.random() * 1000);
				%>

				<div id="popup" class="main_pop" style="position: absolute;">
					<form method="post" action="/GuiltyPleasure/shop">
						<div id="contents"
							style="position: relative; top: <%=topPosition%>px; left: <%=leftPosition%>px; z-index:1000;">
							<input type="image" name="submit" value="submit"
								src="/GuiltyPleasure/CORDING/shop/img/pikachu.gif" /> <input
								type="hidden" name="id" value="<%=id%>"><input
								type="hidden" name="cmd" value="bonusPoint">
						</div>
					</form>
				</div>
				<%
				}
				%>



				<br>
				<br>

				<!-- 템플릿 적용 페이지 -->
				<div class="row">
					<div
						style="padding-top: 0px; height: 90px; background-color: #4fd2c2">
						<div
							class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
							<h2
								class="fh5co-lead animate-single product-animate-1 fadeIn animated">Item
								Shop</h2>
							<p
								class="fh5co-sub animate-single product-animate-2 fadeIn animated">
								<font size="3"> 실력이 구리면 어쩔 수 없죠. 템빨로 승부하세요!<%=id%>님!
								</font>
							</p>
						</div>
					</div>
				</div>


				<div class="row" align="center">
					<div class="col-md-1 to-animate fadeInUp animated">
						<!-- 첫번째 페이지인 경우 빼고 이전페이지로 돌아가는 화살표 생성 -->
						<%
							if (nowPage != 0) {
						%>
						<form action="/GuiltyPleasure/shop" method="post">
							<input type="hidden" name="cmd" value="SHOPLIST"> <input
								type="hidden" name="nowPage" value="<%=nowPage - 1%>"> <input
								type="image" name="Submit" value="Submit"
								src="/GuiltyPleasure/CORDING/shop/img/pre.png">
						</form>

						<%
							}
						%>



					</div>
					<div class="col-md-10">

						<div class="row">

							<!-- 4개씩 한페이지, 마지막데이터까지 출력하고 반복문 끝 -->
							<%
							for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
								if (i == totalRecord) {
									if (id.equals("master")) {
							%>

							<!--관리자인경우 마지막데이터까지 출력된 다음 아이템추가버튼 보이게하기 -->
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12">

								<a class="fh5co-figure to-animate fadeInUp animated">

									<figure>
										<input type="image" class="add" onclick="addModal()"
											src="/GuiltyPleasure/CORDING/shop/img/add.png" />
									</figure>
								</a>

							</div>
							<%
									}
									break;
							}

									Shop item = (Shop) list.get(i);
							%>


							<!-- 삼품 목록 출력 -->
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12">

								<a class="fh5co-figure to-animate fadeInUp animated"
									style="border: 1px solid gray;">
									<figure>
										<img
											src="/GuiltyPleasure/CORDING/shop/img/<%=item.getS_itemcode()%>.png"
											onERROR="this.src='/GuiltyPleasure/CORDING/shop/img/default.jpg'"
											class="img-responsive">
									</figure>

									<h3 class="fh5co-figure-lead">
										<hr><%=item.getS_itemname()%><hr>
									</h3>

									<p class="fh5co-figure-text">
										<c:set var="cnt" value="${cnt+1}" />
										<font size="2"> 상품가격 : <%=item.getS_price()%><br>
											사용기한: <%=item.getS_deadline()%><br> 남은수량 : <%=item.getS_limit_num()%>
										</font>
									<p align="right">
										<button type="button" role="buy"
											class="btn btn-default btn-xs" onclick="buyModal(${cnt})">
											구매</button>

										<!-- 히든 버튼으로 아이템의 수량, 가격 값 저장/ 값을 체크하여 구매 불가능한 상황에서는 jquery에서 구매 모달 대신 구매 불가 모달을 띄울수있도록 함-->
										<input type="hidden" id="getLimit${cnt}"
											value="<%=item.getS_limit_num()%>"> <input
											type="hidden" id="getPoint" value="<%=uDto.getPoint()%>">
										<input type="hidden" id="getPrice${cnt}"
											value="<%=item.getS_price()%>">

										<button type="button" role="explain"
											class="btn btn-default btn-xs" onclick="explainModal(${cnt})">설명</button>

										<!-- 관리자일경우 설정버튼 -->
										<%
											if (id.equals("master")) {
										%>
										<input type="image" class="update"
											onclick="updateModal(${cnt})"
											src="/GuiltyPleasure/CORDING/shop/img/edit.png" />
										<%
											}
										%>
									</p>

								</a>

							</div>


							<!-- 구매 버튼 모달 -->
							<div class="modal fade" id="buyModal${cnt}" role="dialog"
								data-backdrop="" aria-hidden="true" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">

											<h3><%=item.getS_itemname()%></h3>
										</div>
										<div class="modal-body">
											<p><%=item.getS_itemname()%>살래?
											</p>
											이거가격:
											<%=item.getS_price()%><br> 니포인트:
											<%=uDto.getPoint()%>
											<form action="/GuiltyPleasure/shop" method="post"
												id="buy${cnt}">
												<%
													//닉네임 변경아이템일경우 닉네임 변경란 추가

														if (item.getS_itemcode().equals("SIC0009")) {
												%>
												<div class="form-group" align="center">
													<label class="col-sm-5 control-label">닉네임</label>
													<div class="col-sm-7" align="center">
														<input type="text" name="nickname" class="form-control">
													</div>
												</div>
												<%
													}
												%>
												<input type="hidden" name="code"
													value="<%=item.getS_itemcode()%>"> <input
													type="hidden" name="cmd" value="SHOPBUY"> <input
													type="hidden" name="id" value="<%=id%>"> <input
													type="hidden" name="userPoint"
													value="<%=uDto.getPoint() - item.getS_price()%>">
											</form>

										</div>
										<div class="modal-footer">
											<div class="row" align="center">
												<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
													<button type="button" class="btn btn-default" role="buy"
														onclick="document.getElementById('buy${cnt}').submit();">구매</button>


												</div>
												<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 설명 버튼 모달 -->
							<div class="modal fade" id="explainModal${cnt}" data-backdrop=""
								data-dismiss="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">

											<h3><%=item.getS_itemname()%></h3>

										</div>
										<div class="modal-body">
											<p><%=item.getS_content()%></p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 관리 버튼 모달 -->
							<div class="modal fade" id="updateModal${cnt}" data-backdrop="">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">

											<h3><%=item.getS_itemname()%></h3>
										</div>
										<div class="modal-body">
											<form action="/GuiltyPleasure/shop" method="post"
												id="edit${cnt}" class="form-horizontal">

												<br>
												<div class="form-group">
													<label class="col-sm-2 control-label">코드</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="code"
															value="<%=item.getS_itemcode()%>" disabled="disabled">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">이름</label>
													<div class="col-sm-10">
														<input type="text" name="name" class="form-control"
															value="<%=item.getS_itemname()%>">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">가격</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="price"
															value="<%=item.getS_price()%>">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">수량</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="limit"
															value="<%=item.getS_limit_num()%>">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">기한</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="deadline"
															value="<%=item.getS_deadline()%>">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">설명</label>
													<div class="col-sm-10">
														<textarea class="form-control" name="content"><%=item.getS_content()%></textarea>
													</div>
												</div>

												<input type="hidden" name="code"
													value="<%=item.getS_itemcode()%>"> <input
													type="hidden" name="cmd" value="SHOPUPDATE">
											</form>
										</div>

										<div class="modal-footer">
											<div class="row">
												<div class="col-md-4 col-sm-4 col-xs-4 col-xxs-4">
													<button type="button" class="btn btn-default" role="update"
														onclick="document.getElementById('edit${cnt}').submit();">수정</button>

												</div>
												<div class="col-md-4 col-sm-4 col-xs-4 col-xxs-4">
													<form action="/GuiltyPleasure/shop" method="post">
														<input type="hidden" name="code"
															value="<%=item.getS_itemcode()%>"> <input
															type="hidden" name="cmd" value="SHOPDELETE">
														<button type="submit" class="btn btn-default">삭제</button>

													</form>
												</div>
												<div class="col-md-4 col-sm-4 col-xs-4 col-xxs-4">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<%
								}
							%>





							<!-- 추가 버튼 모달 -->
							<div class="modal fade" id="addModal" data-backdrop="">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">

											<h3>추가해보자</h3>
										</div>
										<div class="modal-body">
											<form action="/GuiltyPleasure/shop" method="post" id="add">
												<p>
													이름:<input type="text" name="name" value=""><br>
													가격:<input type="text" name="price" value=""><br>
													수량:<input type="text" name="limit" value=""><br>
													기한:<input type="text" name="deadline" value=""><br>
													설명:
													<textarea cols="25" rows="5" name="content"></textarea>
													<input type="hidden" name="cmd" value="SHOPADD">
												</p>
											</form>
										</div>
										<div class="modal-footer">
											<div class="row" align="center">
												<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
													<button type="submit" class="btn btn-default"
														onclick="document.getElementById('add').submit();">추가</button>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-6 col-xxs-6">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>





							<!-- 구매시 남은수량이 없을때 모달/돈 부족할때 모달 -->
							<div class="modal fade" id="cantBuyModal" data-backdrop=""
								data-dismiss="modal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">

											<h3>어머나!</h3>

										</div>
										<div class="modal-body">
											<!-- 재고는있는데 포인트가 부족한경우에는 jquery에서 다른 메시지로 변경함 -->
											<p id="check"></p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- 마지막페이지가 아닌 경우 다음 버튼 -->
					<div class="col-md-1 to-animate fadeInUp animated">
						<%
							if (nowPage < totalPage - 1) {
						%>
						<form action="/GuiltyPleasure/shop" method="post">
							<input type="hidden" name="cmd" value="SHOPLIST"> <input
								type="hidden" name="nowPage" value="<%=nowPage + 1%>"> <input
								type="image" name="Submit" value="Submit"
								src="/GuiltyPleasure/CORDING/shop/img/next.png">
						</form>

						<%
							}
						%>
					</div>
				</div>
				<!-- 템플릿 적용 페이지 끝 -->
				<br>
				<div align="center">
					<font color=gray> <%=nowPage + 1%> / <%=totalPage%> Pages
					</font> <br> <br>

				</div>



			</div>
		</div>

		
	</div>
</body>
</html>
