<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import = " vo .*" %>
<%

		// mall.signupAction.jsp
			//만약 로그인 중에 이파일을접근했을때 인덱스로
	if(session.getAttribute("loginMemberEmail")!= null){
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return ;	//강제로끝낼떄도 쓰인다.
		
	}

		request.setCharacterEncoding("UTF-8");
		String memberEmail = request.getParameter("memeberEmail");
		System.out.println(memberEmail+"이메일 확인 ");
		
		String memberPw = request.getParameter("memeberPw");
		System.out.println(memberPw+"비밀번호 확인 ");
		
		String memberName = request.getParameter("memeberName");
		System.out.println(memberName +" 이름 확인 ");
		
		// 사용가능한 이메일  No or Yes
		MemberDao memberDao = new MemberDao();
		Member member = memberDao.selectMemeberEmailCk(memberEmail);  // 가입 이메일 ck 메서드 Dao 에서 호출 
		if(member != null){		
			System.out.println("이미 사용하고있는 이메일 입니다");
			response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
			return;
		}
			Member paramMember =new Member();
			paramMember.setMemberEmail (memberEmail);
			paramMember.setMemberPw ( memberPw);
			paramMember.setMemberName (memberName);
			memberDao.insertMember(paramMember);
	
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>