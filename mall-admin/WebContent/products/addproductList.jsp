<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.sql.* " %>
<%@ page import = "java.util.* " %>
<%
if (session.getAttribute("loginAdminId")	== null){    //로그인 하지않으면 login.jsp 화면으로 이동한다. 
response.sendRedirect("/mall-admin/login.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>Mall-admin.addProductList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body >
	<div>
				<jsp:include page="/inc/menu.jsp"></jsp:include>	<!-- 톰캣에서 실행 -->
	</div>
	<%	
	
		CategoryDao categoryDao = new CategoryDao();		//categoryDao는 dao패키지안에있는 categoryDao를 참조한다.
			ArrayList<Categorys> categoryList = categoryDao.selectCategoryList();
	%>
	<div class = "text-secondary" >
	<h1 class = "text-secondary">상품 추가</h1>
		<form method="post" action= "/mall-admin/products/addProductAction.jsp"  >
		<table class = "table-primary" class= "table-sm" class="table-responsive-sm">	
		<!-- 테이블 꾸미기 -->
			<tr>
				
				<td>category_id </td> 
				<!-- 카테고리 목록을 이미 있는 목록에서 선택하도록 만든다. -->
				<td>
					<select	name ="categoryId">
					<option value = " ">카테고리 선택</option>
				
					<%
										for(Categorys c: categoryList){
									%>
								<option value = "<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
					<%
						}
					%>
				
							
						</select>	
					</td>
			</tr>
			
			<tr>
					<td>products_name</td>		
					<td>
						<input type ="text" name ="productsNmae">
					</td>
			</tr>

			<tr>		
						<td>products_price</td>	
						<td> 
							<input type ="text" name ="productsPrice">
						</td>	
			</tr>	
			<tr>
					<td>products_content</td>
					<td>
						<textarea rows = "5" cols= "80" name= "productsContent"></textarea>	

						
				</td>
			</tr>
			
			<tr>
					<td>products_soldout</td>	
						<td>
							<!--  상품목록추가 화면에  N이면 품절아님 Y이면 품절로 표시 -->
							<input type = "radio" name = "productsSoldout" value= "N" checked = "checked" >품절아님	
							<input type = "radio" name="productsSoldout" value= "Y" >품절 	
						</td>
					

			</tr>
			
					
			
		</table>
		
		<button type="submit"class="btn btn-primary"> 상품추가</button>
		</form>
		</div>
</body>
</html>