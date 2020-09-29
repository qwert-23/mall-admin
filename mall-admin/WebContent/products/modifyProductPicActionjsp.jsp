<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest " %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy " %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%

   //   modifyProductPicActionjsp.jsp
		
	//1. 상품아이디와 이미지 파일을 받는다 .
	//2. 이미지파일을 서버 /images 폴더에 새로운이름을 저장한다. 
	//3. 저장된 이미지의 이름을 상품테이블에 수정한다. ex) defualt.jpg -> 새로생성된 이름으로 변경 한다.


		/* <form enctype = "multipart/form -data"> 방식은 기존방식 사용불가 

		String productId = request.getParameter("productId");
		String productPic = request.getParameter("productPic");
		
		System.out.println(productId+"는 <--productId 검사");		//null
		System.out.println(productPic+"는 <--productPic 검사");	//null
		
		 cos.jar 외부라이브러리 사용 (내부라이브러리 사용도 가능하지만 사용방법이 복잡)
		 
		 
		 MultipartRequest multi = new MultipartRequest(request, 경로 , size(크기), "utf-8",new DefaultFileRenamePolicy ); 
		*/
	
		
		int size = 1024 * 1024 * 100 ;	//1kbyte 
		
		
		String path = application .getRealPath("images");
	
		 MultipartRequest multi = new MultipartRequest(request, path , size, "utf-8", new DefaultFileRenamePolicy() ) ; 
		 
		 int productId = Integer.parseInt(multi.getParameter("productId"));
		System.out.println(productId+"<--productId");
		
		
		//System.out.println(multi.getOriginalFileName("productPic")+"<--파일원본이름");
		String productPic =multi.getFilesystemName("productPic");
		System.out.println(multi.getFilesystemName("productPic")+"<--새로생성된 파일이름");
		
		//update product set product_pic =? where product_id =?
		//productDao.updateProductPic(product);			
		
		Products product = new Products();
		product.setProductId( productId);
		product.setProductPic(productPic);
		
		
%>



