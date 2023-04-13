package com.myjdbc.conroller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.myjdbc.model.vo.Department;

public class MyJdbcTest {
	public static void main(String[] args) {
		
		Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","BS","BS");
			
			String sql= "SELECT * FROM DEPARTMENT";
			
			stmt=conn.createStatement();
			
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				Department d= new Department();
				d.setDeptId(rs.getString("dept_id"));
				d.setDeptTitle(rs.getString(2));
				d.setLocationId(rs.getString("location_id"));
				System.out.println(d);
			}
									
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null)
					stmt.close();
				if(conn!=null)conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
