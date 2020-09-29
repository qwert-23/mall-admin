package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;
import commons.DButil;
import vo.*;

public class MemberDao {
	public ArrayList<Member> selectMemberList()throws Exception{
		ArrayList<Member> list =new ArrayList<Member>();
		
		DButil dbutil =new DButil();		//	DButil에 Connection을 미리만들어 놓고  
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 받아온다.
		
	String sql ="select member_email,member_pw, member_name, member_date from member";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs =stmt.executeQuery();
	
	while(rs.next()) {
			Member member = new Member();
			member.setMemberEmail (rs.getString("member_email"));
			member.setMemberPw ( rs.getString ("member_pw"));
			member.setMemberName ( rs.getString ("member_name"));
			member.setMemberDate ( rs.getString ("member_date"));
			list.add(member);
		}
			conn.close ();
			return list;
			
	}
		
}
