package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DButil;
import vo.Products;

// mall.ProductDao.jsp
public class ProductDao {
	public Products selectProductOne(int productId) throws Exception{
		Products  product = null;
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();
		String sql = "select product_id, product_name, product_content, product_pic, product_price, product_soldout from product where product_id?=";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		if(rs.next()){
			Products p = new Products();
			p.setProductId ( rs.getInt ("product_id"));
			p.setProductName ( rs.getString ("product_name"));
			p.setProductContent ( rs.getString ("product_content"));
			p.setProductPic ( rs.getString ("product_pic"));
			p.setProductPrice ( rs.getInt ("product_price"));
			p.setProductSoldout ( rs.getString("product_soldout"));
			
			
		}
		conn .close();
		return product;
	
	}
	
	public ArrayList<Products> selectProductList()throws Exception{
		ArrayList<Products> list = new ArrayList<Products>();
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
		String sql = " select product_id, category_id,product_name,product_price,product_soldout from products limit 0,6 ";

		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		
		while(rs.next()){
			Products p = new Products();
			p.setProductId ( rs.getInt ("product_id"));
			p.setCategoryId (rs.getInt("category_id"));
			p.setProductName (rs.getString("product_name"));
			p.setProductPrice (rs.getInt ("product_price"));
			p.setProductSoldout (rs.getString("product_soldout"));
		
				
			list.add(p);
	
		}
		conn.close ();
		return list; 
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
	}	
