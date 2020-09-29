package dao;


import java.sql.*;
import vo.*;
import java.util.*;

import commons.DButil;
// mall-admin ProductDao.java
//테이블 이름이 product 이지만 오류로 인하여 테이블 이름을 products로 변경하였습니다.  
public class ProductDao {	
	public void updateProductSoldout(int productId, String productSoldout) throws Exception{ //n or y
		DButil dbutil =new DButil();		//	DButil에 Connection을 미리만들어 놓고  
		Connection conn =dbutil.getConnection();	// conn 값을 DButil에서 받아온다. 
		String sql = "update products set product_soldout = ? where product_id = ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");
			
		}else {
			stmt.setString(1, "Y");
		
			
		}
		stmt.setInt(2, productId);
		int row =stmt.executeUpdate();
		System.out.println(row+"행수정");	
		conn.close();
	}

	
	
	public Products selectProductOne(int productId) throws Exception {
		Products product = null;
		DButil dbutil =new DButil();		//	중복을 줄이고  보수를 쉽게하기 위해 DButil에 미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 받아온다.
		String sql = "select product_id, cateogry_id, product_name, product_price, product_content, product_soldout, product_pic from products where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Products();
			product.setProductId (rs.getInt("product_id"));
			product.setCategoryId (rs.getInt("category_id"));
			product.setProductName (rs.getString("product_name"));
			product.setProductPrice (rs.getInt("product_price"));
			product.setProductContent ( rs.getString("product_content"));
			product.setProductSoldout  (rs.getString("product_soldout"));
			product.setProductPic	(rs.getString("product_pic"));
			
			
		}
		conn.close();
		return product;
		
	
		
}
		public void insertProduct(Products products) throws Exception{ 
			DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고  
			Connection conn =dbutil.getConnection();	// conn을 return한값을 불러온다.
			String sql = "insert into products(category_id ,product_name , product_price, product_content, product_soldout)vlaues(?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, products.getCategoryId());
			stmt.setString(2, products.getProductName());
				stmt.setInt(3, products.getProductPrice());
			stmt.setString(4, products.getProductContent());
			stmt.setString(5, products.getProductSoldout()); 
			stmt.executeUpdate();
			
			
			conn.close ();
		}
		
		
		
	
		public ArrayList<Products>selectProductListByCategoryId(int categoryId)throws Exception{
		ArrayList<Products> list = new ArrayList<Products>();
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
		String sql = " select product_id, category_id,product_name,product_price,product_soldout, product_pic from products where category_id = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs =stmt.executeQuery();		
		
		while(rs.next()){
			Products p = new Products();
			
			p.setProductId(rs.getInt ("product_id"));
			p.setCategoryId (rs.getInt("category_id"));
			p.setProductName (rs.getString("product_name"));
			p.setProductPrice ( rs.getInt ("product_price"));
			p.setProductSoldout ( rs.getString("product_soldout"));
			p.setProductPic (rs.getString("product_pic"));
		
				
			list.add(p);
			
			
		}
			conn.close ();
			return list; 
		
	}
	
		public ArrayList<Products> selectProductList()throws Exception{		//전체 ProductList 보여주기
			ArrayList<Products> list = new ArrayList<Products>();
			DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
			Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
			String sql = " select product_id, category_id,product_name,product_price,product_soldout from products ";

			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs =stmt.executeQuery();
			
			while(rs.next()){
				Products p = new Products();
				
				p.setProductId  (rs.getInt ("product_id"));
				p.setCategoryId (rs.getInt("category_id"));
				p.setProductName ( rs.getString("product_name"));
				p.setProductPrice ( rs.getInt ("product_price"));
				p.setProductSoldout ( rs.getString("product_soldout"));
			
					
				list.add(p);
		
			}
			conn.close ();
			return list; 
	}
}
