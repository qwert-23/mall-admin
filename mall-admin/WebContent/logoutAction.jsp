<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%
	session.invalidate();	// 세션을 비우고 화면을 로그인 화면으로 변경한다.
	response.sendRedirect("/mall-admin/login.jsp");



%>