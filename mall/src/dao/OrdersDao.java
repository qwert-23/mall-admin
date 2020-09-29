package dao;
import java.util.*;

import commons.DButil;
import vo.*;
import java.sql.*;

		
//mall.OrdersDao.jsp
public class OrdersDao {		
		public ArrayList<Orders>selectOrdersList()throws Exception{
			ArrayList<Orders> list = new ArrayList<Orders>();
			DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
			Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
			String sql ="select orders_id, prodcut_id, orders_amount, orders_price , member_email, orders_addr, orders_state ,orders_date from orders  ";
			PreparedStatement stmt =conn.prepareStatement(sql);
			ResultSet rs =stmt.executeQuery();
			if(rs.next()){
				Orders o = new Orders();
				o.setProductId ( rs.getInt ("product_id"));
				o.setOrdersAmount( rs.getInt ("orders_amount"));
				o.setOrdersPrice ( rs.getInt ("orders_price"));
				o.setMemberEmail ( rs.getString ("member_email"));
				o.setOrdersAddr ( rs.getString ("orders_addr"));
				o.setOrdersDate ( rs.getString("orders_date"));
				
			
			}
			conn.close();
			return list;
				
	
		}
		public void  insertOrders(Orders orders)throws Exception{
			DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
			Connection conn =dbutil.getConnection();	
			String sql ="insert into orders(prodcut_id, orders_amount, orders_price , member_email, orders_addr, orders_state ,orders_date) value(?,?,?,?,?)";
			PreparedStatement stmt =conn.prepareStatement(sql);
			stmt.setInt(1, orders.getProductId());
			stmt.setInt(2, orders.getOrdersAmount());
			stmt.setInt(3, orders.getOrdersPrice());
			stmt.setString(4, orders.getMemberEmail());
			stmt.setString(5, orders.getOrdersAddr());
			stmt.executeUpdate();
			
			
			
			conn.close();
			
			}
		
		}
	

	