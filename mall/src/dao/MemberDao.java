package dao;
import java.sql.*;
import vo.*;
import commons.DButil;


//mall.MemberDao.jsp
public class MemberDao {
			public String login (Member member) throws Exception{	// email 와 pw 가 중복이 있는지 확인
				String memberEmail = null;
				DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
				Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
				String sql = "select member_email from member where member_email =? and member_pw=? ";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, member.getMemberEmail());
				stmt.setString(2, member.getMemberPw());
				ResultSet rs = stmt.executeQuery();
						if (rs.next()) {
							memberEmail =rs.getString("member_email");
							
						}
				conn.close();
				return memberEmail;
			}
	
	
		public void insertMember (Member member) throws Exception{
			DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
			Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
			String sql = " insert into member ( member_email , member_pw, member_name, member_date)value (?,?,?,now())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, member.getMemberEmail());
			stmt.setString(2, member.getMemberPw());
			stmt.setString(3, member.getMemberName());
			stmt.executeLargeUpdate();
			
			conn.close();
			
			
		}
			public Member selectMemeberEmailCk(String memberEmail) throws Exception{ //이메일 중복확인
				Member member =null;
				DButil dbutil =new DButil();		//	중복을 줄이고 보수를 쉽게하기위해 DButil에  미리만들어 놓고 
				Connection conn =dbutil.getConnection();	// conn을 return하여 값을 불러온다.
				String sql = " select id from (select member_email id from member union select admin_id id from admin)t where id =?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString (1, memberEmail);
				ResultSet rs = stmt.executeQuery();
				if(rs.next()) {
					
					member = new Member();
					member.setMemberEmail(rs.getString("id"));
					
					
				}
				
				conn.close();
				return member;
				
			}
}
