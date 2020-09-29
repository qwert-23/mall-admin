<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
		//  mall-admin deleteCategoryAction.jsp
	request.setCharacterEncoding("utf-8");


	String categoryId = request.getParameter("categoryId");
	System.out.println(categoryId +"<-- categoryId");
	Categorys category = new Categorys();
	
	category.setCategoryName (categoryId);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(category);
	

	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");





%>
