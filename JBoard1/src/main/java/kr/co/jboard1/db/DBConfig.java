package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	private static DBConfig instance = new DBConfig();
	private DBConfig() {}

	public static DBConfig getInstance() {
		return instance;
	}

	
	//DB 정보
	private final String HOST = "jdbc:mysql://15.164.100.88:3306/mydb";
	private final String USER = "bigdata";
	private final String PASS = "bigdata";
	
	public Connection getConnection() throws Exception {
		
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);

		return conn;
	}
}