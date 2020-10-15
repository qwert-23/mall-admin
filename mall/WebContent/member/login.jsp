<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
/*request.setCharacterEncoding("utf-8");
	if(session.getAttribute("loginMemberEmail")!=null){			//이미 로그인 상태라면 indext로 이동한다. 
		System.out.println("이미 로그인 상태입니다.");
			response.sendRedirect("/mall/index.jsp");
	return;			
}
*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mall.login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
		crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class=" container">
		<h1>로그인</h1>
		<form method = "post" action= "<%=request.getContextPath() %>/member/loginAction.jsp" id="loginForm">
		<table class="table table-success">
				<tr>
						<td>Email</td>
						<td><input type = "text" name = "memberEmail" value = "admin2@naver.com" id="memberEmail"></td>	
	
			</tr>			
			<tr>
						<td>비밀번호</td>
						<td><input type ="password" name ="memberPw" value = "1234" id ="memberPw"> </td>
						
		
			</tr>	
						
						
		
		</table>
			<div>
				<button type="button" class="btn btn-primary" id="btn">로그인 </button>
				</div>
				</form>
	</div>
<script>
		$("#btn").click(function(){
			
			if($("#memberEmail").val()==""){
				alert("이메일 확인")
				return;
			}else if($("#memberPw").val()==""){
				alert("비밀번호 확인")
				return;
			}
				
			
				
				$("#loginForm").submit();
			
			
		});
		
		</script>
	


</body>
</html>
