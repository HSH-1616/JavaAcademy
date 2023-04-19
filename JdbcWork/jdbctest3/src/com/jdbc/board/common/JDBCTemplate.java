package com.jdbc.board.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		Properties prop=new Properties();
		String path=JDBCTemplate.class
				.getResource("/driver.properties").getPath();
		Connection conn=null;
		try(FileReader fr=new FileReader(path);) {
			prop.load(fr);
			Class.forName(prop.getProperty("driver"));
			conn=DriverManager.getConnection(prop.getProperty("url")
					,prop.getProperty("user")
					,prop.getProperty("pw"));
			conn.setAutoCommit(false);
		}catch(Exception e) {
			e.printStackTrace();
		}return conn;
	}
	public static void close(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.rollback();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
