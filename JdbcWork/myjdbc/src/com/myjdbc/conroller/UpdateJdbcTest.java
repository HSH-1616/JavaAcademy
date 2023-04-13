package com.myjdbc.conroller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.myjdbc.model.vo.Department;

public class UpdateJdbcTest {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "BS", "BS");
			conn.setAutoCommit(false);
			String sql = "SELECT * FROM DEPARTMENT";

			stmt = conn.createStatement();

			int result = stmt.executeUpdate("UPDATE DEPARTMENT SET DEPT_TITLE='학생부',LOCATION_ID='L2' WHERE DEPT_ID='D0'");
			
			if (result > 0)
				conn.commit();
			else
				conn.rollback();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
