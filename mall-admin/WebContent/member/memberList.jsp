<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> malladmin.memberList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class ="container text-warning">
			<h1>memberList </h1>
			<div>
				<jsp:include page = "/inc/menu.jsp"></jsp:include>
			</div>
		
			<%
					MemberDao memberDao =new MemberDao();
					ArrayList<Member> list = memberDao.selectMemberList();
			%>

	
	
		
			<table class="table table-dark table-striped table-hover text-warning ">
			<thead>
			<tr>
					<th>Email</th>
					<th>PW</th>
					<th>Name</th>
					<th>Date</th>
			</tr>	
			</thead>
			<tbody>
				<%
					for(Member m :list){
				%>
						<tr>
							<td><%=m.getMemberEmail()%> </td>
							<td><%=m.getMemberPw()%></td>
							<td><%=m.getMemberName()%></td>
							<td><%=m.getMemberDate()%></td>
	
						</tr>
				<%
						}
				%>
		</tbody>
	</table>
	</div>
		
		
</body>
</html>