<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall.signup.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%
	/*
		회원가입 하력 만듬 
		
	*/


%>


		<h1 class ="text-success" >회원가입  </h1>

	<form method="post" action= "/mall/member/signupAction.jsp"  class="was-validated" id="signupForm">
	<div class="form-group">
		<table class = "table-primary" class= "table-sm" class="table-responsive-sm">
	<thead>	
			<tr>
				<td class="text-primary">Email</td>
				<td><input type= "text"  class="form-control form-control" name = "memeberEmail" id="memberEmail"></td>
			</tr>
			
			<tr>
				<td class="text-primary">pw</td>
				<td><input type = "password" class="form-control form-control" name ="memeberPw" id="memberPw" ><td>
			</tr>
			<tr>
				<td class="text-primary">이름</td>	
				<td><input type= "text"  class="form-control form-control" name = "memeberName" id="memberName"></td>
			</tr>
			
			
						
			
			
		</thead>
	
	
	
	
	
	</table>
	
	
	<button type="button" class="btn btn-primary" id="btn">가입하기 </button>
	</div>
<script>
$("#btn").click(function(){
	
	if($("#memberEmail").val()==""){
		alert("이메일 확인")
		return;
		
	}else if($("#memberPw").val()==""){
		alert("비밀번호 확인")
		return;
		
	} else if ($("#memberName").val()==""){
		alert("이름 확인")
		return;
		
	}
		
	
		
	$("#signupForm").submit();
	
	
});



</script>
	
	
	</form>
</body>
</html>