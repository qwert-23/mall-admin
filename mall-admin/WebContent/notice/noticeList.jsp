<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
if (session.getAttribute("loginAdminId")	== null){     //로그인 하지않으면 login.jsp 화면으로 이동한다. 
response.sendRedirect("/mall-admin/login.jsp");
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall-admin.noticeList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class ="container text-warning">
			<h1>noticeList</h1>
			<div>
				<jsp:include page = "/inc/menu.jsp"></jsp:include>
			</div>
		
			<%
			
					NoticeDao noticeDao =new NoticeDao();
					ArrayList<Notice> list = noticeDao.selectNoticeList();
					
		
					
			%>

	
	
		
			<table class="table table-dark table-striped table-hover text-warning ">
			<thead>
			<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_content</th>
					<th>notice_date</th>
			</tr>	
			</thead>
			<tbody>
				<%
					for(Notice n : list){
				%>
						<tr>
							<td><%=n.getNoticeId()%></td>
							<td><%=n.getNoticeTitle() %></td>
							<td><%=n.getNoticeContent() %></td>
							<td><%=n.getNoticeDate() %></td>
	
						</tr>
				<%
						}
				%>
		</tbody>
	</table>
	</div>

		
</body>
</html>