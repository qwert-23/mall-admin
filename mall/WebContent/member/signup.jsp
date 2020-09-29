<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall.signup.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		<h1 class ="text-success" >회원가입  </h1>

	<form method="post" action= "/mall/member/signupAction.jsp"  class="was-validated" >
	<div class="form-group">
		<table class = "table-primary" class= "table-sm" class="table-responsive-sm">
	<thead>	
			<tr>
				<td class="text-primary">Email</td>
				<td><input type= "text"  class="form-control form-control" name = "memeberEmail" ></td>
			</tr>
			
			<tr>
				<td class="text-primary">pw</td>
				<td><input type = "password" class="form-control form-control" name ="memeberPw" ><td>
			</tr>
			<tr>
				<td class="text-primary">이름</td>	
				<td><input type= "text"  class="form-control form-control" name = "memeberName" ></td>
			</tr>
			
			
						
			
			
		</thead>
	
	
	
	
	
	</table>
	
	
	<button type="submit" class="btn btn-primary">가입하기 </button>
	</div>
	</form>
</body>
</html>