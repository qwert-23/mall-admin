<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		<div>
			<jsp:include page ="/inc/menu.jsp"></jsp:include>
				
		</div>
			

		<%
		NoticeDao categoryDao =new NoticeDao();
		ArrayList<Notice> list = noticeDao.selectNoticeList();
		
		
							%>
		<h1>notice</h1>
		<table class ="table"> 
			
			<tr>
				<td>notice_id</td>
				<td><%=getNoticeId()%></td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><%=notice.noticeTitle %></td>
			</tr>
			<tr>
				<td>notice_comtent</td>
				<td><%= notice.noticeContent %></td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td><%=notice.noticeDate%></td>
			</tr>
			
			
			</table>
						
			
</body>
</html>