package connection;

import java.sql.Connection;
import java.sql.DriverManager;


public class JDBCconnect  {
	public Connection getConnet() {
		final String username= "root";
		final String pass= "1234";
		final String url="jdbc:mysql://localhost:3306/webblog";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, username, pass);
		} catch (Exception e) {
			System.out.println("ket noi fail:" + e);
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		JDBCconnect jdbc = new JDBCconnect();
		Connection con = jdbc.getConnet();
		
		if (con == null) {
			System.out.println("ket noi that bai");
		}else {
			System.out.println("ket noi thanh cong");
		}
	}
}
