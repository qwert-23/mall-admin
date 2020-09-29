package dao;
import java.util.ArrayList;

import commons.DButil;
import vo.*;
import java.sql.*;


// mall.CategoryDao.jsp

public class CategoryDao { //Category리스트 를 받아오게 
		public ArrayList<Categorys> selectCategoryList()throws Exception{
			ArrayList<Categorys> list =new ArrayList<Categorys>();
			
			DButil dbutil =new DButil();		//	DButil에 Connection을 미리만들어 놓고  
			Connection conn =dbutil.getConnection();	// conn을 return하여 값을 받아온다.
			
		String sql ="select category_id,category_name from categorys ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		
		while(rs.next()) {
			
			//notice.setNoticeId (rs.getInt("notice_id"));
				Categorys categorys = new Categorys();
				categorys.setCategoryId (rs.getInt("category_id"));
				categorys.setCategoryName (rs.getString ("category_name"));
				list.add(categorys);
			}
				conn.close ();
				return list;
				
		}
		public ArrayList<Categorys> selectCategoryCkList()throws Exception{
			ArrayList<Categorys> list =new ArrayList<Categorys>();
			
			DButil dbutil =new DButil();		//	DButil에 Connection을 미리만들어 놓고  
			Connection conn =dbutil.getConnection();	// conn을 return하여 값을 받아온다.
			
		String sql ="select category_id, category_pic from categorys where category_ck = 'Y' limit 0,4";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		
		while(rs.next()) {
				Categorys categorys = new Categorys();
				categorys.setCategoryId (rs.getInt("category_id"));
				categorys.setCategoryPic (rs.getString ("category_pic"));
				list.add(categorys);
			}
				conn.close ();
				return list;
				
		}
		

}
