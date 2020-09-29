<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall// myOrderList</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
		OrdersyDao ordersyDao = new OrdersyDao();		// 
		ArrayList<Orders> categoryList = ordersDao.selectOrdersList();	
	
		
%>
		
		
		

</body>
</html>