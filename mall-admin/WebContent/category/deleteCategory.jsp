<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import ="java.util.*" %>
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
<title>mall-admin deleteCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class ="container text-warning">
		<div>
				<jsp:include page = "/inc/menu.jsp"></jsp:include>
		</div>
		
<% 
	CategoryDao categoryDao = new CategoryDao();		//categoryDao는 dao패키지안에있는 categoryDao를 참조한다.
	ArrayList<Categorys> categoryList = categoryDao.selectCategoryList();		
		
%>			
		<h1  class="text-warning">카테고리 삭제</h1>
		
		<form method = "post" action = "/mall-admin/category/deleteCategoryAction.jsp" >
	
			
				<!-- 카테고리 목록을 이미 있는 목록에서 선택하도록 만든다. -->
			
					<select	name ="categoryId">
					<option value = " ">카테고리 선택</option>
				
					<%
										for(Categorys c: categoryList){
									%>
								<option value = "<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
								
								<!--카테고리id 보다는 카테고리 이름이 알아보기쉬움 -->
					<%
						}
					%>
				
							
						</select>	
			
			<div><button type = "submit" class="btn btn-outline-info">카테고리 삭제</button></div>
	
		
		</form>	
			</div>
	
</body>
</html>