<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> mall.ProductOne.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		
			
			
<%
					int productId = Integer.parseInt(request.getParameter("productId"));		
					ProductDao productDao =new ProductDao();
				Products product = new ProductDao().selectProductOne(productId);
						%>
			
		<h1>상품 상세보기</h1>
		<form method ="post" action = "<%=request.getContextPath() %>/orders/addOrdersAction.jsp">
			<input type ="hidden" value = "<%= product.getProductId() %>"  name = "productId"> 
			<input type ="hidden" value = "<%= product.getProductPrice() %>"  name = "productPrice">
			 
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
				<div><button type = "submit">주문</button></div>
				</form>
		<table class ="table"> 
			<tr>
				<td>product_pic</td>
				<td><img src = "<%=request.getContextPath()%>/images/<%=product.getProductPic() %>"></td>
			
			</tr>
			<tr>
				<td>product_id</td>
				<td><%=product.getProductId() %></td>
			</tr>
			<tr>
				<td>category_id</td>
				<td><%=product.getCategoryId() %></td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><%= product.getProductName() %></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><%=product.getProductPrice() %></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><%=product.getProductContent()%></td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td><%=product.getProductSoldout() %>	</td>	
				
			<td>	
			
			
					
		
		</table>
</body>
</html>