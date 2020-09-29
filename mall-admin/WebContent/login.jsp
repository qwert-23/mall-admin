<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("loginAdminId")!=null){			//이미 로그인 상태라면 indext로 이동한다. 
		System.out.println("이미 로그인 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;			
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		<h1 class ="text-success" >관리자 로그인 </h1>

	<form method="post" action= "/mall-admin/loginAction.jsp"  class="was-validated" >
	<div class="form-group">
		<table class = "table-primary" class= "table-sm" class="table-responsive-sm">
	<thead>	
			<tr>
				<td class="text-primary">관리자ID</td>
				<td><input type= "text"  class="form-control form-control" name = "adminId" value = "admin@naver.com"></td>
			</tr>	
			<tr>
				<td class="text-primary">관리자PW</td>
				<td><input type = "password" class="form-control form-control" name ="adminPw"  value ="1234" ><td>
			</tr>	
				
			
						
			
			
		</thead>
	
	
	
	
	
	</table>
	
	
	<button type="submit" class="btn btn-primary">로그인 </button>
	</div>
	</form>
</body>
</html>