<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%
if (session.getAttribute("loginAdminId")	== null){     //로그인 하지않으면 login.jsp 화면으로 이동한다. 
response.sendRedirect("/mall-admin/login.jsp");
}		
		

	//mall -admin.modifyproductSoldoutAction.jsp
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productSoldout = request.getParameter("productSoldout");
	ProductDao productDao = new ProductDao();
	productDao.updateProductSoldout(productId,productSoldout);
	
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?porductId="+productId);


%>