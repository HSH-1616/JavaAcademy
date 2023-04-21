package com.jdbc.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jdbc.common.JDBCTemplate;
import com.jdbc.model.dto.ModelDTO;

public class ModelDao {
	private Properties sql=new Properties();
	
	public List<ModelDTO> selectAllMember(Connection conn){
		Statement stmt=null;
		ResultSet rs=null;
		List<ModelDTO> m=new ArrayList();
		String sql="SELECT * FROM EMPLOYEE";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) m.add(getMember(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}return m;
	}
	
	private ModelDTO getMember(ResultSet rs) throws SQLException {
		ModelDTO m=new ModelDTO();
		m.setEmpId(rs.getString("emp_id"));
		m.setEmpName(rs.getNString("emp_name"));
		m.setEmpNo(rs.getNString("emp_no"));
		m.setEmail(rs.getString("email"));
		m.setPhone(rs.getString("phone"));
		m.setDeptCode(rs.getString("dept_code"));
		m.setJobCode(rs.getString("job_code"));
		m.setSalLevel(rs.getString("sal_level"));
		m.setSalary(rs.getInt("salary"));
		m.setBonus(rs.getDouble("bonus"));
		m.setManagerId(rs.getInt("manager_id"));
		m.setHireDate(rs.getDate("hire_date"));
		m.setEntDate(rs.getDate("ent_date"));
		m.setEntYN(rs.getString("ent_yn").charAt(0));
		
		return m;
	}
	
}
