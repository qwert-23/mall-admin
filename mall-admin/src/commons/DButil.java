package commons;
import java.sql.*;
public class DButil {
	public Connection  getConnection() throws Exception{		// connection을 받는다		반본을 줄여서 실수나 또는 수정할부분을 고치는데 시간이 절약되는 이득을 볼수있다.
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr ="jdbc:mariadb://localhost:3306/mall";
		String dbid = "root";
		String dbpw = "java1004";
		Class.forName (driver);
		Connection conn = DriverManager.getConnection (dbaddr,dbid,dbpw);
		
		return conn;
		
		
		
	}
}
