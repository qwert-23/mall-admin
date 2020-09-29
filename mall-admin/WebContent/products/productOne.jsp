<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mall-admin.ProductOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
				
		</div>
			
			
<%		
				
					int productId = Integer.parseInt(request.getParameter("productId"));	
						System.out.println(productId+"<---productId 검사");
						
					ProductDao productDao =new ProductDao();
				Products products = new ProductDao().selectProductOne(productId);
						%>
			
		<h1>상품 상세보기</h1>
		<form method ="post" action = "<%=request.getContextPath() %>/orders/addOrdersAction.jsp"></form>
			<input type ="hidden" value = "<%= products.getProductId() %>"  name = "productId"> 
			<input type ="hidden" value = "<%= products.getProductPrice() %>"  name = "productPrice">
			 
			<div>
			 		
			
				수량:
			<select name = "ordersAmount">
			<%
				for (int i=1; i<5; i+=1){//테이블
					
			%>		
				<option value ="<%=i %>"><%=1 %> </option>
			<%
				}
			%>
		
			</select> 개
			</div>
			<div>
					배송주소:
					<input type ="text" name = "orderAddr">
					
			</div>
		<table> 
			<tr>
				<td>product_pic</td>
				<td><img src = "<%=request.getContextPath()%>/images/<%=products.getProductPic() %>">
				<a href = "/mall-admin/products/modifyProductPic.jsp"></a>	
				</td>
			
			</tr>
			<tr>
				<td>product_id</td>
				<td><%=products.getProductId() %></td>
			</tr>
			<tr>
				<td>category_id</td>
				<td><%=products.getCategoryId() %></td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><%= products.getProductName() %></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><%=products.getProductPrice() %></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><%=products.getProductContent()%></td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td><%=products.getProductSoldout() %>	</td>	
				
			<td>	
			
				<%
				if(products.getProductSoldout().equals("Y"))		{		
							
					%>
						<a href= "/mall-admin/product/modifyProductSoldoutAction.jsp?prodcutId=<%=products.getProductId()%>&productSoldout=<%=products.getProductSoldout()%>">[품절]</a>
					<% 
					} else{
					
					%>
						<a href = "/mall-admin/product/modifyproductSoldoutAction.jsp?productId=<%=products.getProductId()%>&productSoldout=<%=products.getProductSoldout()%> ">[판매]</a>
					<%
					}
				
					%>	
					
		</td>
			</tr>
			
			
		</table>
</body>
</html>