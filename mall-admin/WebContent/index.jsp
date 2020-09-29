<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	if (session.getAttribute("loginAdminId")	== null){     //로그인 상태가 아니라면 login화면으로 이동한다.
		response.sendRedirect("/mall-admin/login.jsp");
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<!-- Bootstrap 을 쓸수있게해주는 링크 -->
</head>
<body>	
	
	<div class="jumbotron text-center">

 
	<h1 class= "text-warning">관리자 메인 페이지</h1>
	<p class="text-warning"><%=session.getAttribute("loginAdminId")%>님 Hello</p>
	
	
		
		<h2 class="text-warning">프로젝트 개요 </h2>
		<h3>10월 15일까지  쇼핑물 마무리 10월16일부터 비디오 </h3>
		
		<p class="text-warning">2020년에 9월 16일 만들기 시작하였고 메서드를 활용하여 만드는 쇼핑몰 프로젝트이고 mariadb,Tomcat을 사용하였다.</p>
		<p class="text-warning">2020년 9월 18일 오전 상세보기 오후 Bootstrap  </p>
		<p class="text-warning">9월22일 session을 이용한 로그인 </p>
		<p class="text-warning">9월25일 공지사항 리스트 출력 , 회원가입 , 회원 리스트 출력  </p>
		<p class="text-warning">Bootstrap: https://www.w3schools.com/bootstrap4/bootstrap_get_started.asp</p>
	
		

		
				<!-- 글자   노란색   테이블색 청색 으로 통일  -->
		
		
		
		
		
				<jsp:include page="/inc/menu.jsp"></jsp:include>
				<!-- menu.jsp에있는  <a href 를 사용하게 해준다. -->
				<!-- <h4> 테이블 orders 만들었고  주문관리창에 상품번호로나와 이름을 알수없으니 join을 활용하였다.</h4> -->
				<!-- 127.0.0.1  root  3306 -->
				<!-- mariadb오류로 인해 재설치 후 테이블  오류로 인해  테이블 이름을  product -> products , category->categorys로 변경함 -->
				<!-- https://ovenapp.io/     gdlms.co.kr id: jimese2-->
				<!-- 로그인 정보를 sesseion 에 저장 (page < request < session <application) -->
				<!-- 모델1이 jsp 보다 많이만들어야하지만 보수하는데 편리하다는 장점이있다.  -->
				
				
		</div>	


</body>
</html>