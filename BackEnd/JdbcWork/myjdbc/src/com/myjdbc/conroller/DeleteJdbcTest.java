package com.myjdbc.conroller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.myjdbc.model.vo.Department;

public class DeleteJdbcTest {
	
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "BS", "BS");
			conn.setAutoCommit(false);
			String sql = "SELECT * FROM DEPARTMENT";

			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
				
			sql="DELETE FROM DEPARTMENT WHERE DEPT_ID='D0'";
			
			int result = stmt.executeUpdate(sql);
			
			if (result > 0)
				conn.commit();
			else
				conn.rollback();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
