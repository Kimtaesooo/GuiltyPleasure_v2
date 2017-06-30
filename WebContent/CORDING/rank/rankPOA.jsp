<%@page import="dto.u_single"%>
<%@page import="dto.u_battle"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="dao" class="dao.rankmodule.rank"/>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../bootstrap332/css/bootstrap.min.css">
<script src="../../bootstrap332/js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap332/js/bootstrap.min.js"></script>
<style>body{margin-top: 40px}</style>
<!-- 
	나중에 수정해야할 사항
	랭킹 판수 200판 이상인 사람만 불러와서 출력하는데 내 랭킹이 200판이 안될때 등수 처리
 -->
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String type = request.getParameter("up_type");
	if(type==null){
		type = "A";
	}
	String id ="";
	int myrank=0;
	if(session.getAttribute("u_id")!=null){
	id = (String)session.getAttribute("u_id");
	myrank=dao.SingleMyRank(id, type)-1;
	}
	List list = dao.getBoardList2(type);
%>
<title>Ranking</title>
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
#fh5co-testimony {
  background: #8bccec;
  color: #fff;
  padding: 8em 0;
}
</style>
<!-- nav바 수정부분 여기까지 -->
</head>
<body>
<jsp:include page="/test_nav.jsp"/>
            
    
<div class="container" id="fh5co-main">   
        <div class="row col-lg-12">
     	<br><br><br>
            <div class="col-lg-12" align="center">
                <h1 class="page-header">정답률 랭킹 </h1>
                <a href="rankBattle.jsp">배틀 승률</a> &nbsp;&nbsp;&nbsp;<a href="rankPOA.jsp">정답률</a><br><br>
           	<br>
           	<form role="form" action="rankPOA.jsp" method="post">
           	<div class="col-lg-12" align="center">
           		<div class="col-lg-3"></div>
	           	<div class="col-md-2">
	           		유형
	           	</div>	
	           	<div class="col-md-2">
		           	<select class="form-control" name="up_type" id="up_type">
		  						<option <%if(type.equals("A")){%>selected<%} %>>A</option>
		  						<option <%if(type.equals("B")){%>selected<%} %>>B</option>
		  						<option <%if(type.equals("C")){%>selected<%} %>>C</option>
		  						<option <%if(type.equals("D")){%>selected<%} %>>D</option>
					</select>
				</div>
				<div class="col-md-2">
					 <button type="submit">찾기</button>
				</div>	
			</div>	 
           	</form>
           	<br><br><br><br>
            </div>
		 <%
		 	if(list.size()>0){
					u_single One = (u_single)list.get(0);			
					u_single Two = (u_single)list.get(1);			
					u_single Three = (u_single)list.get(2);			
		%>		          	
          
      <div id="fh5co-page">
		<div id="fh5co-wrap">
           <div id="fh5co-testimony" data-section="testimonies">
				    <div class="container">
				    	<div class="row animate-box">

							<div class="owl-carousel">
								<div class="item">
									<div class="col-md-3 col-sm-3 col-xs-4 col-xxs-12">
						    			<figure class="fh5co-vcard"><img src="https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/number_1_blue-128.png" 
						    			alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive"></figure>
						    		</div>
						    		<div class="col-md-9 col-sm-9 col-xs-8 col-xxs-12">
						    			<blockquote>
						    				<p>&ldquo;<%=One.getU_comment()%>&rdquo;</p>
						    			</blockquote>
						    			<p class="fh5co-author fh5co-uppercase-sm"><span><%=One.getU_nickname()%></span>, 1위.</p>
						    		</div>
						    	</div>

						    	<div class="item">
									<div class="col-md-3 col-sm-3 col-xs-4 col-xxs-12">
						    			<figure class="fh5co-vcard"><img src="https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/number_2_blue-128.png" 
						    			alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive"></figure>
						    		</div>
						    		<div class="col-md-9 col-sm-9 col-xs-8 col-xxs-12">
						    			<blockquote>
						    				<p>&ldquo;<%=Two.getU_comment()%>&rdquo;</p>
						    			</blockquote>
						    			<p class="fh5co-author fh5co-uppercase-sm"><span><%=Two.getU_nickname()%></span>, 2위.</p>
						    		</div>
						    	</div>

						    	<div class="item">
									<div class="col-md-3 col-sm-3 col-xs-4 col-xxs-12">
						    			<figure class="fh5co-vcard"><img src="https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/number_3_blue-128.png" 
						    			alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive"></figure>
						    		</div>
						    		<div class="col-md-9 col-sm-9 col-xs-8 col-xxs-12">
						    			<blockquote>
						    				<p>&ldquo;<%=Three.getU_comment()%>&rdquo;</p>
						    			</blockquote>
						    			<p class="fh5co-author fh5co-uppercase-sm"><span><%=Three.getU_nickname()%></span>, 3위.</p>
						    		</div>
						    	</div>


						    </div>

				    	</div>
				    </div>
			    </div>
			   </div>
		  </div>
 <%}else{ %>
 			<div class="alert alert-dismissible alert-success col-lg-3">				  
				  <h4>데이터가 없습니다.</h4>	
            </div>
 <%} %>
	<div><br><br><br>&nbsp;</div>
   	<h2 class="page-header" align="center">내 랭킹</h2>
<%

	if(id.length()>0){
		if(myrank==-1){%>
		<div align="center">
		<h3>200판을 채우지 못했습니다 :(</h3>
		</div>	
		<%}
		else{
		u_single my = (u_single)list.get(myrank);
%>
            	
            	<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>순위</th>
				      <th>닉네임</th>
				      <th>정답수</th>
				      <th>오답수</th>
				      <th>정답률</th>
				      <th>문제유형</th>
				    </tr>
				  </thead>
				  <tbody>
				  <tr class="active">
				      <td><%=myrank+1%></td>
				      <td><%=my.getU_nickname() %></td>
				      <td><%=my.getA_cnt() %></td>
				      <td><%=my.getWa_cnt()%></td>
				      <td><%=my.getA_cnt()*100/(my.getA_cnt()+my.getWa_cnt())%>%</td>
				      <td><%=my.getUp_type()%></td>
				    </tr>
				  </tbody>
				</table>
<%
	}
}else{
%>		
<div align="center">

<a href="../login/login.html">로그인</a>이 필요한 서비스 입니다.
</div>
<%		
}
%>
				<br><br>
                <h2 class="page-header" align="center">전체 랭킹</h2>
                <table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>순위</th>
				      <th>닉네임</th>
				      <th>정답수</th>
				      <th>오답수</th>
				      <th>정답률</th>
				      <th>문제유형</th>
				    </tr>
				  </thead>
				  <tbody>
 <%
 if(list.size()>0){
	for(int i=0; i<list.size();i++){
			u_single dto = (u_single)list.get(i);	
%>			
		<tr <%if(i%2==0){%>class="info"<%} %>>
			<td><%=i+1%></td>
			<td><%=dto.getU_nickname()%></td>
			<td><%=dto.getA_cnt() %></td>
			<td><%=dto.getWa_cnt() %></td>
			<td><%=dto.getA_cnt()*100/(dto.getA_cnt()+dto.getWa_cnt())%>%</td>
			<td><%=dto.getUp_type() %></td>
			<% }
			}else{%>
			<td>데이터가 없습니다.</td>
			<%} %>
		</tr>

				  </tbody>
				</table> 
            </div>
        </div>
         <footer>
            <div class="row">
                <div class="col-md-12">
                    <p>Copyright &copy; Guilty Pleasure</p>
                </div>
            </div>

        </footer>

<!-- container -->   
     
</body>
</html>