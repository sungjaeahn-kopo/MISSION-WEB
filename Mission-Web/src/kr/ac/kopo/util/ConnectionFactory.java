package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	// 연결객체를 얻어오는게 목적이므로 returntype = connection
	public Connection getConnection() {
		Connection conn = null;
		try {
			// 1단계 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2단계 DB 접속
			String url = "jdbc:oracle:thin:@192.168.119.119:1521:dink";
			String user = "system";
			String password = "system";
			
			conn = DriverManager.getConnection(url, user, password);		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
