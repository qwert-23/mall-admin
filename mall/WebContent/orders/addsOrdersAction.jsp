<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
		// mall.addOrdersAction
	request.setCharacterEncoding("utf-8");
						
	if (session.getAttribute("loginMemberId")	== null){     
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
}
	int productId = Integer.parseInt(request.getParameter("productId"));
	int ordersAmount = Integer.parseInt(request.getParameter("ordersAmount"));
	int ordersPrice=  ordersAmount * Integer.parseInt (request.getParameter("productPrice"));
	String  memberEmail = (String) (session. getAttribute ("loginMemberEmail"));
	String ordersAddr = request.getParameter("ordersAddr");
	
	Orders orders =new Orders();
	orders.setProductId (productId);
	orders.setOrdersAmount(ordersAmount);
	orders.setOrdersPrice(ordersPrice);
	orders.setMemberEmail(memberEmail);
	orders.setOrdersAddr(ordersAddr);
	
	
	
	
	OrdersDao ordersDao =new OrdersDao();
	ordersDao.insertOrders(orders);
	response.sendRedirect(request.getContextPath()+"/orders/myOrderList.jsp");
	
%>