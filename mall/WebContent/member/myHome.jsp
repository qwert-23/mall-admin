<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myHome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
		crossorigin="anonymous">
</head>

<body>
<div  class ="container">	
	<div>	<!-- 좌측 최상단 문자 그리고 검색바  -->
		<br>
	
		<div class="row">
 	 <h2 class="col"><a href = "index.jsp"  >Goodee shop</a></h2>  
 	 
 	 
 	 
 	 
 	<%
 		/*
 			자신의 이메일 ,이름 ,  자신의 이메일의 ordersList 
 			
 		*/
 	
 	
			OrdersDao ordersDao = new OrdersDao();
			ArrayList<Orders> OrdersList = ordersDao.selectOrdersList();
			
		%>	 	
 	 	
 	 	
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
				
				
				
				<li class = "navbar-item"><a class = "nav-link" href="<%=request.getContextPath() %>/member/myHome.jsp">내정보</a></li>
				<%
					}
				%>
			</ul>
			
			</nav>
		
		</div>
		
		
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