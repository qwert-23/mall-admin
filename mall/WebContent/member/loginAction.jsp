<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>

<%
	/// mall.loginAction.jsp
/*
	if(session.getAttribute("loginMemberEmail")!=null){	//만약 값이 null이 아니면 로그인 성공 
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
*/
		request.setCharacterEncoding("UTF-8");
		String memberEmail = request.getParameter("memberEmail");	
		String memberPw =request.getParameter("memberPw");
		
		System.out.println(memberEmail + "<-memberEmail");
			//확인	
		System.out.println(memberPw + "<-memberPw");
		//확인	
		
		Member paramMember =new Member();
		paramMember. setMemberEmail (memberEmail);
		paramMember. setMemberPw    (memberPw);
		
		
		
		MemberDao memberDao = new MemberDao();
		String loginMemberEmail = memberDao.login(paramMember);
		if(loginMemberEmail == null){			//만약 값이 null 이면 로그인 실패
			System.out.println("loginMemberEmail == null");
			response.sendRedirect(request.getContextPath()+"/member/login.jsp");
			
		}else{
				session.setAttribute("loginMemberEmail",loginMemberEmail);	
				response.sendRedirect(request.getContextPath()+"/member/index.jsp");
			
				
		}
		
		%>
