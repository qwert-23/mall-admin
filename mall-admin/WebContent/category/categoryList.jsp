<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
if (session.getAttribute("loginAdminId")	== null){     //로그인 하지않으면 login.jsp 화면으로 이동한다. 
response.sendRedirect("/mall-admin/login.jsp");
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall-admin.categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class ="container text-warning">
			<h1>cateoryList </h1>
			<div>
				<jsp:include page = "/inc/menu.jsp"></jsp:include>
			</div>
		<div>
				<a href="/mall-admin/category/addCategory.jsp" class="btn btn-outline-warning" role="button">카테고리 추가</a>
				<a href="/mall-admin/category/deleteCategory.jsp" class="btn btn-outline-warning" role="button">카테고리 삭제</a>
		</div>
			<%
				CategoryDao categoryDao =new CategoryDao();
					ArrayList<Categorys> list = categoryDao.selectCategoryList();
			%>

	
	
		
			<table class="table table-dark table-striped table-hover text-warning ">
			<thead>
			<tr>
					<th>category_no</th>
					<th>category_name</th>
			</tr>	
			</thead>
			<tbody>
				<%
					for(Categorys c :list){
				%>
						<tr>
							<td><%=c.getCategoryId()%> </td>
							<td><%=c.getCategoryName()%></td>
							<td>	</td>
	
						</tr>
				<%
						}
				%>
		</tbody>
	</table>
	</div>
		
		
</body>
</html>