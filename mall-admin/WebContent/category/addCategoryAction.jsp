<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import= "dao.*" %>

<%
	//mall-admin addCategoryAction.jsp  
	
	
	request.setCharacterEncoding("utf-8");
	String categoryName = request.getParameter("categoryName");
	Categorys category = new Categorys();
	
	category.setCategoryName (categoryName);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	

	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>