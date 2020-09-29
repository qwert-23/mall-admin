package dao;
import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DButil;




//mall.NoticeDao.jsp
public class NoticeDao {
	public ArrayList<Notice>selectNoticeList() throws Exception{				// 최근 공지2개를 불러온다.
		ArrayList<Notice> list = new  ArrayList<Notice>();
				DButil dbutil =new DButil();		//	DButil에 Connection을 미리만들어 놓고  
		Connection conn =dbutil.getConnection();	// conn을 return하여 값을 받아온다.
		
		
	String sql ="select notice_id,notice_title, notice_content, notice_date from notice order by notice_date desc";
	PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs =stmt.executeQuery();
		while(rs.next()) {
			Notice notice = new Notice();
			//notice.noticeId = rs.getInt("notice_id");
			notice.setNoticeId (rs.getInt("notice_id"));
			notice.setNoticeTitle (rs.getString ("notice_title"));
			notice.setNoticeContent (rs.getString ("notice_content"));
			notice.setNoticeDate (rs.getString ("notice_date"));
			list.add(notice);
		}
	
	
	
		conn.close ();
		return list;

			
			
			
	}
			public Notice selectNoticeOne(int noticeId) throws Exception {
			
					
					
			
				
				
				return null;
			}
	
}
