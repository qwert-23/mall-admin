package dao;
import java.util.*;

import commons.DButil;
import vo.*;
import java.sql.*;

		//	데이터 베이스 오류로 인해 재설치  product가 오류로인해  products로 변경 
		// mall-admin OrdersDao.java
public class OrdersDao {		
	public void updateOrdersState(Orders orders)  {		// Orders 의  주문상태랑 주문번호 
		String sql = "update orders set orders_state=? where orders_id =? ";
		
		
			
		}
	
		public Orders selectOrdersOne(int ordersId) {  // Orders orders 선택
			String sql = "select orders_id, orders_state  from orders where orders_id=? ";
			return null;
		}

	

		//  throws Exception  웬만한 오류는 신경 을 쓰지 않는다 .
	
	public ArrayList <OrdersAndProducts> selectOrdersList() throws Exception{    //orders 테이블에서 전체 리스트를 출력 
		ArrayList<OrdersAndProducts> list = new ArrayList<OrdersAndProducts>();
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
		String sql ="select  o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join products p   on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<--stmt"); // 시험출력
		
		ResultSet rs =stmt.executeQuery();
		System.out.println(rs+"<-rs"); // 시험출력
		
		while(rs.next()){		// orders ,products join
			OrdersAndProducts op = new OrdersAndProducts(); // 
			op.setOrders(new Orders());	       //op는  orders와 prodcust에 테이블을 공유 한다.
			op.setProducts ( new Products());
			
			op.getOrders().setOrdersId(rs.getInt ("o.orders_id"));		//orders 에 있는 orders id 
			op.getOrders().setProductId (rs.getInt("o.product_id"));	// products와 orders 어느 테이블에도 속해있지만 orders 를 선택 
			op.getOrders().setOrdersAmount ( rs.getInt("o.orders_amount"));
			op.getOrders().setOrdersPrice ( rs.getInt ("o.orders_price"));
			op.getOrders().setMemberEmail ( rs.getString("o.member_email"));
			op.getOrders().setOrdersAddr ( rs.getString("o.orders_addr"));
			op.getOrders().setOrdersState ( rs.getString("o.orders_state"));
			op.getOrders().setOrdersDate ( rs.getString("o.orders_date"));
			op.getProducts().setProductName ( rs.getString("p.product_name"));	//	products만 있어 products
			
			list.add(op);
		
		}
			
			
		conn.close (); //접속해제 (잊어버리지 않기)
		return list;
	}
	
		//
	public ArrayList<String> selectOrdersStateList() throws Exception{  	// 
		ArrayList<String> list = new ArrayList<String>();
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
		String sql ="select distinct orders_state from orders";  // 
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt+"<--stmt"); // 시험출력
		
		ResultSet rs =stmt.executeQuery();
	
		System.out.println(rs+"<-rs"); // 시험출력
		while (rs.next()) {
			
			
			list.add(rs.getString("orders_state"));
		
		
		}
		conn.close ();
		return list;
	}


	

	public ArrayList<OrdersAndProducts> selectOrdersListByState(String ordersState)throws Exception {	// 주문 상태  "결제완료", "배송준비중" "배송완료", "주문취소" 로 분류 
		ArrayList<OrdersAndProducts> list = new ArrayList<OrdersAndProducts>();
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
		String sql ="select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.producte_name from orders o inner join products p   on o.product_id = p.product_id orders where orders_state = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);	
		
		stmt.setString(1, ordersState);
		
		ResultSet rs =stmt.executeQuery();
		System.out.println(rs+"<-rs"); // 시험출력
		while(rs.next()){
			
			OrdersAndProducts op = new OrdersAndProducts();		
			op.setOrders( new Orders());
			op.setProducts( new Products());
			
			op.getOrders().setOrdersId (rs.getInt ("o.orders_id"));		
			op.getOrders().setProductId ( rs.getInt("o.product_id"));
			op.getOrders().setOrdersAmount ( rs.getInt("o.orders_amount"));
			op.getOrders().setOrdersPrice ( rs.getInt ("o.orders_price"));
			op.getOrders().setMemberEmail ( rs.getString("o.member_email"));
			op.getOrders().setOrdersAddr ( rs.getString("o.orders_addr"));
			op.getOrders().setOrdersState (rs.getString("o.orders_state"));
			op.getOrders().setOrdersDate ( rs.getString("o.orders_date"));
			op.getProducts().setProductName ( rs.getString("p.product_name"));
			
			list.add(op);
		
		}
		conn.close (); //접속해제 (잊어버리지 않기)
		return list;
	
	}
	
}