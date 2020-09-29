package dao;
import vo.Admin;
import java.sql.*;

import commons.DButil;
	
//mall-admin AdminDao.java	
public class AdminDao {	//
	public Admin login(Admin admin) throws Exception {		//실패하면 null 리턴 (참조타입 가능)
		Admin returnAdmin =null;
		DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
		
		
		String sql = "select admin_id from admin where admin_id =? and admin_pw = ? ";// admin 으로부터  id와 pw의 일치하는지를 알아본다.
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs= stmt.executeQuery();
		if(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.setAdminId(rs.getNString("admin_id"));
			
		}
		
		
		return returnAdmin ;	// null= 실패   null x 로그인 성공 
	
	
	}
	
			

}
