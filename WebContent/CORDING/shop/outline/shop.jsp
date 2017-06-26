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
			<header id="fh5co-hero" data-section="home" role="banner"
				style="background: url(images/bg_2.jpg) top left; background-size: cover;">
				<div class="fh5co-overlay"></div>
				<div class="fh5co-intro">
					<div class="container">
						<div class="row"></div>
					</div>
				</div>
			</header>
			<!-- END .header -->

			<div id="fh5co-main">


				<!-- 상점 페이지 시작 -->

				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br>
				<script>
					jQuery(function() {

						/*
						$("a[role='explain']").click(function() {
							$("#explainModal").modal();
						});
						 */
						var explainButton = $("button[role='explain']");
						var updateButton = $("button[role='update']");
						var buyButton = $("button[role='buy']");

						for (i = 1; i <= explainButton.length; i++) {
							explainModal(i);
						}
						for (i = 1; i <= updateButton.length; i++) {
							updateModal(i);
						}
						for (i = 1; i <= buyButton.length; i++) {
							buyModal(i);
						}

					});

					function explainModal(i) {
						$("#explainButton" + i).bind("click", function(e) {
							$("#explainModal" + i).modal();
						});
					}
					function updateModal(i) {
						$("#updataButton" + i).bind("click", function(e) {
							$("#updateModal" + i).modal();
						});
					}
					function buyModal(i) {
						var defaultText = $("#Check").text()

						$("#buyButton" + i)
								.bind(
										"click",
										function(e) {
											var leftMoney = document
													.getElementById("getPoint").value
													- document
															.getElementById("getPrice"
																	+ i).value;

											//상품 수량이 0이 아닐때에만 구매 가능하도록
											if (document
													.getElementById("getLimit"
															+ i).value == 0) {
												$("#cantBuyModal").modal();
												$("#Check").text(defaultText);
											} else {
												if (leftMoney < 0) {
													$("#Check")
															.text(
																	-leftMoney
																			+ "원 더 갖고오세요^^");
													$("#cantBuyModal").modal();
												} else {
													$("#buyModal" + i).modal();
												}
											}

										});

					}

					$(function() {
						$("#addButton").click(function() {
							$("#addModal").modal();
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
					int pagePerBlock = 3;
					int totalBlock = 0;
					int nowBlock = 0;

					totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

					if (request.getParameter("nowPage") != null)
						nowPage = Integer.parseInt(request.getParameter("nowPage"));

					if (request.getParameter("nowBlock") != null)
						nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

					totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

					beginPerPage = nowPage * numPerPage;
				%>

				<%
					//아이디가져오기
					String id = (String) session.getAttribute("u_id");
					UserInfoDTO uDto = userdao.searchUserInfo(id);
				%>
				<c:set var="totalRecord" value="${itemList.size()}" />
				<br>












				<!-- 템플릿 적용 페이지 -->
				<div class="row">
					<div
						class="col-md-8 col-md-offset-2 fh5co-section-heading text-center">
						<h2
							class="fh5co-lead animate-single product-animate-1 fadeIn animated">Item
							Shop</h2>
						<p
							class="fh5co-sub animate-single product-animate-2 fadeIn animated">
							실력이 구리면 어쩔 수 없죠. 템빨로 승부하세요!
							<%=id%>님!
						</p>
					</div>
				</div>

				<div class="row" align="center">
					<div class="col-md-1">

						<%
							if (nowPage > 0) {
						%>
						<form action="/GuiltyPleasure/shop" method="post">
							<input type="hidden" name="cmd" value="SHOPLIST"> <input
								type="hidden" name="nowPage" value="<%=nowPage - 1%>"> <input
								type="image" name="Submit" value="Submit"
								src="/GuiltyPleasure/daon_v1/img/pre.png">
						</form>

						<%
							}
						%>



					</div>
					<div class="col-md-10">

						<div class="row">


							<%
								for (int i = beginPerPage; i < numPerPage + beginPerPage; i++) {
									if (i == totalRecord) {
										if (id.equals("master")) {
							%>

							<!--마지막데이터까지 출력된 다음추가버튼 보이게하기 -->
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12">

								<a class="fh5co-figure to-animate fadeInUp animated">

									<figure>
										<input type="image" class="add" id="addButton"
											src="/GuiltyPleasure/daon_v1/img/add.png" />
									</figure>
									<h3 class="fh5co-figure-lead">아이템 추가</h3>
									<p class="fh5co-figure-text">아이템을 추가하자.</p>
								</a>

							</div>
							<%
								}
										break;
									}

									Shop item = (Shop) list.get(i);
							%>






							<!-- 삼품 출력 -->
							<div class="col-md-3 col-sm-6 col-xs-6 col-xxs-12">

								<a class="fh5co-figure to-animate fadeInUp animated">
									<figure>
										<img
											src="/GuiltyPleasure/daon_v1/img/<%=item.getS_itemcode()%>.png"
											onERROR="this.src='/GuiltyPleasure/daon_v1/img/default.jpg'"
											class="img-responsive">
									</figure>
									<h3 class="fh5co-figure-lead"><%=item.getS_itemname()%></h3>
									<p class="fh5co-figure-text">
										상품가격 :
										<%=item.getS_price()%><br> 사용기한:
										<%=item.getS_deadline()%><br> 남은수량 :
										<%=item.getS_limit_num()%>
									<p align="right">
										<button type="button" role="buy"
											class="btn btn-default btn-xs" id="buyButton${cnt=cnt+1}">

											구매</button>
										<input type="hidden" id="getLimit${cnt}"
											value="<%=item.getS_limit_num()%>"> <input
											type="hidden" id="getPoint" value="<%=uDto.getPoint()%>">
										<input type="hidden" id="getPrice${cnt}"
											value="<%=item.getS_price()%>">
										<button type="button" role="explain"
											class="btn btn-default btn-xs" id="explainButton${cnt}">설명</button>

										<!-- 관리자일경우 설정버튼 -->
										<%
											if (id.equals("master")) {
										%>
										<input type="image" class="update" id="updataButton${cnt}"
											src="/GuiltyPleasure/daon_v1/img/edit.png" />
										<%
											}
										%>
									</p>

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
													//닉네임 변경아이템일경우 변경란 추가

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
											<p id="Check">재고가 떨어졌어요ㅠㅠ 다음에 다시 들러주세요</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>









							<div class="clearfix visible-sm-block"></div>

							<div class="fh5co-spacer fh5co-spacer-sm"></div>

							<div
								class="col-md-4 col-md-offset-4 text-center to-animate fadeInUp animated">
								<a href="#" class="btn btn-primary">View All Products</a>
							</div>
						</div>
					</div>



					<!-- 다음 버튼 -->
					<div class="col-md-1">
						<%
							if (nowPage < totalPage - 1) {
						%>
						<form action="/GuiltyPleasure/shop" method="post">
							<input type="hidden" name="cmd" value="SHOPLIST"> <input
								type="hidden" name="nowPage" value="<%=nowPage + 1%>"> <input
								type="image" name="Submit" value="Submit"
								src="/GuiltyPleasure/daon_v1/img/next.png">
						</form>

						<%
							}
						%>
					</div>
				</div>
				<!-- 템플릿 적용 페이지 끝 -->

				<div align="center">
					<font color=gray> <%=nowPage + 1%> / <%=totalPage%> Pages
					</font> <br> <br> <br> <br>

				</div>

			</div>
		</div>

		<footer id="fh5co-footer" style="">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-footer-content">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 col-md-push-3">
							<h3 class="fh5co-lead">About</h3>
							<ul>

							</ul>
						</div>
						<div class="col-md-3 col-sm-4 col-md-push-3">
							<h3 class="fh5co-lead">Support</h3>
							<ul>

							</ul>
						</div>
						<div class="col-md-3 col-sm-4 col-md-push-3">
							<h3 class="fh5co-lead">More Links</h3>
							<ul>
								<li><a href="#">Feedback</a></li>
								<li><a href="#">Frequently Ask Questions</a></li>
								<li><a href="#">Terms of Service</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Careers</a></li>
								<li><a href="#">More Apps</a></li>
							</ul>
						</div>

						<div class="col-md-3 col-sm-12 col-md-pull-9">
							<div class="fh5co-footer-logo">
								<a href="index.html">Outline</a>
							</div>
							<p class="fh5co-copyright">
								<small>&copy; 2015. All Rights Reserved. <br> by <a
									href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a>
									Images: <a href="http://pexels.com/" target="_blank">Pexels</a></small>
							</p>
							<p class="fh5co-social-icons">
								<a href="#"><i class="icon-twitter"></i></a> <a href="#"><i
									class="icon-facebook"></i></a> <a href="#"><i
									class="icon-instagram"></i></a> <a href="#"><i
									class="icon-dribbble"></i></a> <a href="#"><i
									class="icon-youtube"></i></a>
							</p>
						</div>

					</div>
				</div>
			</div>
		</footer>
	</div>






</body>
</html>
