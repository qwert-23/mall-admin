<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
		crossorigin="anonymous">
</head>
<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList <Categorys> categoryList1  = categoryDao.selectCategoryList();
		ArrayList <Categorys> categoryList2 =  categoryDao.selectCategoryCkList();
	
		
	
			

%>
<body>
<div  class ="container">	
	<div>	<!-- 좌측 최상단 문자 그리고 검색바  -->
		<br>
	
		<div class="row">
 	 <h2 class="col"><a href = "index.jsp"  >Goodee shop</a></h2>  
 	 	<form>
 	 
 	 		
 	 		<input type ="text">
 	 	
 	 		<a href="/mall/comingSoon/construction.jsp" >검색</a>

 	 	</form>
 	 	
 	 		<br>	
  			
  				<div class = "col">
				<i class='fas fa-shopping-cart' style='font-size:36px'></i>
				<i class='fas fa-user-alt' style='font-size:36px'></i>
			
			</div>
	</div>
	
		</div>
			</div>
		<div>
			
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<ul class = "navbar-nav">
				<%
					if(session.getAttribute("loginMemberEmail")	== null){	//로그인 상태 N    로그인 ,회원가입 
						
				%>
				
				<li class = "navbar-item"><a class = "nav-link" href=" /mall/member/login.jsp">로그인</a></li>
				
				
				
				<li class = "navbar-item"><a class = "nav-link" href="<%=request.getContextPath() %>/member/signup.jsp">회원가입</a></li>
				
				<%
					}
				%>
				<%
					if(session.getAttribute("loginMemberEmail")	!= null){  // 로그인 상태 Y  로그아웃 , 내 정보 
						
				%>
				<li class = "navbar-item"><a class = "nav-link" href=" /mall/member/logoutAction.jsp">로그아웃</a></li>
				
				
				
				<li class = "navbar-item"><a class = "nav-link" href="/mall/comingSoon/construction.jsp">내정보</a></li>
				<%
					}
				%>
			</ul>
			
			</nav>
		
		</div>
		<div>	
			<div class="row">
				<div class="col-sm-2">
					<!-- 전체카테고리 -->
					<div class="btn-group-vertical">
						<%
							for (Categorys c : categoryList1) {
						%>
								<a href="/mall/comingSoon/construction.jsp" class="btn btn-outline-dark"><%=c.getCategoryName()%></a>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-10">
					<img src="/mall/images/back.jpg"width="1000" height="450" >
					
				</div>
			</div>
		</div>
		<br>
		
		<!-- 추천 카테고리 이미지 링크 -->
		<div>
			<table class="table">
				<tr>
					<%
						for (Categorys c : categoryList2) {
					%>
						<td>	
							<a href=""> 
								<img src="<%=request.getContextPath()%>/images/<%=c.getCategoryPic()%>" class="rounded-circle" width="200" height="200">
							</a>
						</td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
		<br>
		
		<%
			Calendar today = Calendar.getInstance(); //
		%>
		<!-- 카테고리별 추천상품 -->
		<div>
			<h3>
				오늘의 추천 상품 <!--   시간  -->
				<span class="badge badge-primary"> 	
					<%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH) + 1%>.<%=today.get(Calendar.DAY_OF_MONTH)%>
				</span>
			</h3>
			<div>
				<%
					for (Categorys c : categoryList1) { // 추천상품 아래 카테고리 
				%>
				<a href="/mall/comingSoon/construction.jsp" class="btn btn-outline-danger"><%=c.getCategoryName()%></a>
				<%
					}
				%>
			</div>
		</div>
		<br>
		
		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Products> productList = productDao.selectProductList();
		%>
		<!-- 상품 6개 -->	
		<table class="table">
			<tr>
				<%
					int i = 0;
					for (Products p : productList) {
						i=i+1;
				%>
						<td>
							<div class="card">
								<img class="card-img-top" src='<%=request.getContextPath()%>/images/<%=p.getProductPic()%>'>
							<div class="card-body">
									<h4 class="card-title"><%=p.getProductName()%></h4>
									<p class="card-text"><%=p.getProductPrice()%>원</p>
								</div>
							</div>
						</td>
				<%
						if(i%3==0) {
				%>
							</tr><tr>
				<%			
						}	// <%n.getNoticeId()
					}
				%>
			</tr>
		</table>
	<div>
		
			<br>
			
			<%
				
			NoticeDao noticeDao =new NoticeDao();
			ArrayList<Notice> list = noticeDao.selectNoticeList();
			%>
					<!-- 공지사항 최신2개 -->
					
			<div class="col"><h5>공지사항</h5></div>
			
			<%
					for(Notice n : list){
				%>
							<br>
						<tr>
							
							<td><%=n.getNoticeId()%></td>
							<td><%=n.getNoticeTitle()%></td>
							<td><%=n.getNoticeContent()%></td>
							
						</tr>
					
	
					
				<%
						}
				%>
			
	</div>
		
		
</body>
</html>