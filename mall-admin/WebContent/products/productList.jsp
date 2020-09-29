<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
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
<title>mall-admin.prodctList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class ="container text-warning">
	
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
				
		</div>

	<%
		request.setCharacterEncoding("utf-8");	// 한글 꺠짐 방지 
			int categoryId= -1;				
			if(request.getParameter("categoryId")!= null){  //null 방지
		categoryId =Integer.parseInt(request.getParameter("categoryId"));  
		
			}


			ProductDao productDao = new ProductDao();		// ProductDao는 producDao를 받는다
			ArrayList<Products> productList = null;		
			if(categoryId == -1){
		productList = productDao.selectProductList();		//productList = productDao 에있는 selectProductlist이다.
			}else{
		productList = productDao.selectProductListByCategoryId(categoryId);	
			}
			
			
			
			
			
			CategoryDao categoryDao = new CategoryDao();		// 상품을 출력하기 위해 Dao에서 받아옴 
			ArrayList<Categorys> categoryList = categoryDao.selectCategoryList();
	%>
	<h1>상품목록</h1>
	<div>
			<%
				for(Categorys c: categoryList ){		//
			%>
					<a href= "/mall-admin/products/productList.jsp:categoryId=<%=c.getCategoryId()%>">
						[<%=c.getCategoryId()%><%=c.getCategoryName()%>]
					</a>
					
			<%
									}
								%>
	</div>
	
	
	<table class="table table-dark table-striped table-hover text-warning ">	<!-- 클래스 꾸미기 -->

		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>	
			</tr>
			
		</thead>
		<tbody>
				<%
					for(Products p : productList){		// productList를 출력하고  품절항목이 Y인  상품에게는 선을 긋는다.
												if(p.getProductSoldout().equals("Y")){
				%>
				<tr>
					<td><del><%=p.getProductId()%></del></td>
					<td><del><%=p.getCategoryId() %></del></td>
					<td><del><%=p.getProductName() %></del></td>	
					<td><del><%=p.getProductPrice() %></del></td>
					<td><del>품절</del></td>
				</tr>
						
				
				<%
				
				
							
						}else {
							
				%>
					<tr>
						<td><%=p.getProductId()%></td>
						<td><%=p.getCategoryId() %></td>
						<td><%=p.getProductName() %></td>	
						<td><%=p.getProductPrice() %></td>
						<td>판매중</td>
					</tr>
							
				<%
				
						}}
				%>
				
				
				
					
					
		
		
	</tbody>		
	</table>
	
			<table>
			<tr>
				<td><a href= "/mall-admin/products/addproductList.jsp">상품추가</a></td>
			</tr>
			
			</table>
			
				 
	</div>		

</body>
</html>