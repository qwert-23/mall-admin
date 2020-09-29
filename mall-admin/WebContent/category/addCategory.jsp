<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	if (session.getAttribute("loginAdminId")	== null){     //로그인 하지않으면 login.jsp 화면으로 이동한다. 
	response.sendRedirect("/mall-admin/login.jsp");
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall-admin addCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class ="container text-warning">
		<div>
				<jsp:include page = "/inc/menu.jsp"></jsp:include>
		</div>
			
		<h1  class="text-warning">카테고리 입력</h1>
		
		<form method = "post" action = "/mall-admin/category/addCategoryAction.jsp" >
		<div>category_name</div>
	
			<div><input type = "text" name = "categoryName"></div>
			<div><button type = "submit" class="btn btn-outline-info">카테고리 추가 </button></div>
	
		
		</form>	
			</div>
	
</body>
</html>