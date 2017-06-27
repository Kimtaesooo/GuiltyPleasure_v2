<%@page import="dto.u_battle"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="dao" class="dao.rankmodule.rank"/>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String id ="";
	int myrank=0;
	if(session.getAttribute("u_id")!=null){
	id = (String)session.getAttribute("u_id");
	myrank=dao.BattleMyRank(id)-1;
	}
	List list = dao.getBoardList();
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
<br><br><br>    
<div class="container">   
        <div class="row col-lg-12">
            <div class="col-lg-12" >
            <div class="col-lg-12" align="center">
                <h1 class="page-header">배틀 승률 랭킹 </h1>
               <a href="rankBattle.jsp">배틀 승률</a> &nbsp;&nbsp;&nbsp;<a href="rankPOA.jsp">정답률</a><br><br>
           	<br>
            </div>
 <%
 			if(list.size()>0){
			u_battle One = (u_battle)list.get(0);			
			u_battle Two = (u_battle)list.get(1);			
			u_battle Three = (u_battle)list.get(2);			
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
<div> <br><br><br> &nbsp;</div>
 <h2 class="page-header" align="center">내 랭킹</h2>

<%

if(id.length()>0){
	if(myrank==-1){%>
	<div align="center">
	<h3>200판을 채우지 못했습니다 :(</h3>
	</div>	
	<%}
	else{
	u_battle my = (u_battle)list.get(myrank);
%>
            	
            	<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>순위</th>
				      <th>닉네임</th>
				      <th>승리</th>
				      <th>패배</th>
				      <th>승률</th>
				    </tr>
				  </thead>
				  <tbody>
				  <tr class="active">
				      <td><%=myrank+1%></td>
				      <td><%=my.getU_nickname() %></td>
				      <td><%=my.getU_win() %></td>
				      <td><%=my.getU_lose() %></td>
				      <td><%=my.getU_win()*100/(my.getU_win()+my.getU_lose())%>%</td>
				    </tr>
				  </tbody>
				</table>
<%	}
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
				      <th>승리</th>
				      <th>패배</th>
				      <th>승률</th>
				    </tr>
				  </thead>
				  <tbody>
 <%
 if(list.size()>0){
	for(int i=0; i<list.size();i++){
			u_battle dto = (u_battle)list.get(i);	
%>			
					<tr <%if(i%2==0){%>class="info"<%} %>>
						<td><%=i+1%></td>
						<td><%=dto.getU_nickname()%></td>
						<td><%=dto.getU_win() %></td>
						<td><%=dto.getU_lose() %></td>
						<td><%=dto.getU_win()*100/(dto.getU_win()+dto.getU_lose())%>%</td>
					</tr>
			<% }
			}else{%>
			<td>데이터가 존재하지 않습니다.</td>
			<%} %>
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
</div>
<!-- container -->   
     
</body>
</html>