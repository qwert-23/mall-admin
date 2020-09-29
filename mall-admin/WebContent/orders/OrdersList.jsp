<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = " java.util.*" %>
<%@ page import = " vo.*" %>
<%@ page import = " dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall-adminOrdersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
			<!-- Bootstrap 을 쓸수있게해주는 -->
</head>
<body>
	<div class="table-warning text-primary">
		<div>
					<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
		
		
		
		<%
			request.setCharacterEncoding("utf-8"); // 한글깨지는걸 방지 
			String ordersState = "";			
			if(request.getParameter("ordersState")!= null){		//null이 아니면  ordersState 값을 받는다. 
				ordersState = request.getParameter("ordersState");
				System.out.println(ordersState +"<--ordersState");
			}
				OrdersDao ordersDao =new OrdersDao();			//  OrdersDao는  ordersDao가 가지고 있는걸 가진다.   
				ArrayList<OrdersAndProducts> list = null;
				if(ordersState.equals("")){									//만약 ordersState가 ""와 같으면
					
					list = ordersDao.selectOrdersList();	// 				주문 상태를 보기			
					
				}else{
					list = ordersDao.selectOrdersListByState(ordersState);  
					//              원하는 주문상태별로 보기 
				}
			ArrayList<String> ordersStateList = ordersDao.selectOrdersStateList();
			
		%>
		
		<h1  class="table-primary">주문목록</h1>
			<form method ="post" action = " /mall-admin/orders/OrdersList.jsp ">
				<select name = "ordersState">
				<option value = " ">선택</option>
	
				<%
						for(String s : ordersStateList){
								
				%>
							<option value ="<%=s%>"></option>
				<%
						}
				%>
				</select>
				<button type ="submit" class="btn btn-outline-danger">주문상태별로 보기 </button> 
		</form>
				<table class ="table text-primary" >
				<thead>
					<tr>
						<td>orders_id</td>
						<td>product_id</td>
						<td>orders_amount</td>
						<td>orduer_price</td>
						<td>member_email</td>
						<td>orders_addr</td>
						<td>orders_state</td>
						<td>orders_date</td>
						<td>o.state 수정</td>	<!-- 수정 -->
					</tr>
			</thead>
					<tbody>
					
					<%
					
						for (OrdersAndProducts op :list){
					
					%>
							<tr>
								<td><%=op.getOrders().getOrdersId() %></td>
								<td><%=op.getOrders().getProductId()+op.getProducts().getProductName() %></td> <!-- 상품번호+상품이름  -->
								<td><%=op.getOrders().getOrdersAmount() %></td> <!-- 양 -->
								<td><%=op.getOrders().getOrdersPrice() %></td>	<!-- 가격 -->
								<td><%=op.getOrders().getMemberEmail()%></td>	<!--  이메일 -->
								<td><%=op.getOrders().getOrdersAddr() %></td>	<!-- 주소 -->
								<td><%=op.getOrders().getOrdersState() %></td>	<!-- 상태  -->		
								<td><%=op.getOrders().getOrdersDate() %></td>		<!-- 시간 -->					
								<td> <a href = "/mall-admin/oredrs/modifyordersState.jsp=?ordersId=<%=op.getOrders().getOrdersId()%>"></a>o.ordersState 수정 </td>
							
							
							</tr>
					<%
						}
					
					%>
					</tbody>
		</table>
		
		</div>
		
		
</body>
</html>