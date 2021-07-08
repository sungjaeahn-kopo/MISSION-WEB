package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.Statement;

public class JDBCClose {
	// DB 접속하고 나서 객체 해제 역할
	// Statement, PreparedStatement 둘다 쓸 수 있으므로 묵시적 형변환
	public static void close(Connection conn, Statement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
