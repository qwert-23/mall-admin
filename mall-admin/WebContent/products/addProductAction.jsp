<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>


<%
	//mall-admin.addProductAction.jsp
	if (session.getAttribute("loginAdminId")	== null){     
	response.sendRedirect("/mall-admin/login.jsp");
	}
	
	request.setCharacterEncoding("utf-8");  
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productsName = request.getParameter("productsNmae");			
	int productsPrice = Integer.parseInt(request.getParameter("productsPrice"));		
	String productsContent= request.getParameter("productsContent");	
	String productsSoldout= request.getParameter("productsSoldout");
	
	System.out.println(categoryId + "<--categoryId");
	System.out.println(productsName + "<--productName");
	System.out.println(productsPrice + "<--productsPrice ");
	System.out.println(productsContent + "<--productContent");
	System.out.println(productsSoldout + "<--productsSoldout");
	
	

	Products products = new Products();
	System.out.println(products+"products"); // 시험출력
	
	
	
	products.setCategoryId (categoryId);
	products.setProductName (productsName);
	products.setProductPrice (productsPrice);
	products.setProductContent (productsContent);
	products.setProductSoldout (productsSoldout);
	
	
	
	
	ProductDao productDao = new ProductDao ();
	productDao.insertProduct(products);
	

	response.sendRedirect("/mall-admin/products/productList.jsp");//<a href = ""> 와 비슷하다
%>