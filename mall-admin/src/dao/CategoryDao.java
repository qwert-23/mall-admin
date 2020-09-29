package dao;
import java.util.ArrayList;

import commons.DButil;
import vo.Categorys;
import java.sql.*;

//mall-admin CategoryDao.java
public class CategoryDao { //Category를 추가하는 메서드
	
	public void insertCategory(Categorys categorys) throws Exception{
		DButil dbutil =new DButil();		//	DButil에 Connection 을 만들고 
		Connection conn =dbutil.getConnection();	// return conn 값을 받아 온다. 
		
		
		String sql = " insert into categorys (category_name)values(?)"; //
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,  categorys.getCategoryName());
		stmt.executeLargeUpdate();
		
		conn.close (); // conn 실행하고 닫기
	}
	public void deleteCategory(Categorys categorys) throws Exception{
		DButil dbutil =new DButil();		//	DButil에 Connection 을 만들고 
		Connection conn =dbutil.getConnection();	// return conn 값을 받아 온다. 
		
		
		String sql = " DELETE from categorys where category_id = ?"; //
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,  categorys.getCategoryId());
		stmt.executeLargeUpdate();
		
		conn.close (); // conn 실행하고 닫기 
		
	}
	
		public ArrayList<Categorys> selectCategoryList()throws Exception{
			ArrayList<Categorys> list =new ArrayList<Categorys>();
			
			DButil dbutil =new DButil();		//	DButil에 Connection을 미리만들어 놓고  
			Connection conn =dbutil.getConnection();	// conn을 return하여 값을 받아온다.
			
		String sql ="select category_id,category_name from categorys";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		
		while(rs.next()) {
				Categorys category = new Categorys();
				category.setCategoryId (rs.getInt("category_id"));
				category.setCategoryName ( rs.getString ("category_name"));
				list.add(category);
			}
				conn.close ();
				return list;
				
		}
			
		

}
