package com.jdbc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jdbc.common.JDBCTemplate;
import com.jdbc.model.dto.ModelDTO;

public class ModelDao {
	private Properties sql = new Properties();

	public List<ModelDTO> selectAllMember(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		List<ModelDTO> m = new ArrayList();
		String sql = "SELECT * FROM EMPLOYEE";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next())
				m.add(getEmp(rs));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(stmt);
		}
		return m;
	}

	public List<ModelDTO> selectEmp(Connection conn, String[] total) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ModelDTO> m = new ArrayList();
		String sql = null;

		try {
			if (total[0].equals("SALARY")) {
				sql = "SELECT * FROM EMPLOYEE WHERE SALARY #COL ?";
				sql = sql.replace("#COL", total[2]);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, total[1]);
			} else {
				sql = "SELECT * FROM EMPLOYEE WHERE #COL LIKE ?";
				sql = sql.replace("#COL", total[0]);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + total[1] + "%");
			}
			rs = pstmt.executeQuery();
			while (rs.next())
				m.add(getEmp(rs));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int insertEmp(Connection conn, ModelDTO m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO EMPLOYEE VALUES(?,?,?,?,?,?,?,?,?,?,?,SYSDATE,NULL,'N')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getEmpId());
			pstmt.setString(2, m.getEmpName());
			pstmt.setString(3, m.getEmpNo());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getDeptCode());
			pstmt.setString(7, m.getJobCode());
			pstmt.setString(8, m.getSalLevel());
			pstmt.setInt(9, m.getSalary());
			pstmt.setDouble(10, m.getBonus());
			pstmt.setInt(11, m.getManagerId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateEmp(Connection conn, ModelDTO m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "UPDATE EMPLOYEE SET JOB_CODE=?, DEPT_CODE=?, PHONE=?, EMAIL=? WHERE EMP_ID =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getJobCode());
			pstmt.setString(2, m.getDeptCode());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setInt(5, m.getEmpId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteEmp(Connection conn, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "DELETE EMPLOYEE WHERE EMP_ID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectDept(Connection conn, List arr) {
		PreparedStatement pstmt = null;
		ModelDTO m=(ModelDTO)arr.get(0);
		int num = (int)arr.get(1);
		int result=0;
		String sql = null;
				
		switch (num) {
		case 1:
			sql = "INSERT INTO DEPARTMENT VALUES(?,?,?)";
			break;
		case 2:
			sql = "UPDATE DEPARTMENT SET DEPT_TITLE=?, LOCATION_ID=? WHERE DEPT_ID=?";
			break;
		case 3:
			sql = "DELETE DEPARTMENT WHERE DEPT_ID=?";
			break;
		}
		try {
			pstmt = conn.prepareStatement(sql);
			switch (num) {
			case 1:
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m.getDeptId());
				pstmt.setString(2, m.getDeptTitle());
				pstmt.setString(3, m.getLocationId());
				break;
			case 2:
				
				pstmt.setString(1, m.getDeptTitle());
				pstmt.setString(2, m.getLocationId());
				pstmt.setString(3, m.getDeptId());
				break;
			case 3:
				pstmt.setString(1, "1");
				break;
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println(num);
		System.out.println(m.getDeptId());
		System.out.println(result);
		return result;
	}

	private ModelDTO getEmp(ResultSet rs) throws SQLException {
		ModelDTO m = new ModelDTO();
		m.setEmpId(rs.getInt("emp_id"));
		m.setEmpName(rs.getString("emp_name"));
		m.setEmpNo(rs.getString("emp_no"));
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

	private ModelDTO getDept(ResultSet rs) throws SQLException {
		ModelDTO m = new ModelDTO();
		m.setDeptId(rs.getString("dept_id"));
		m.setDeptTitle(rs.getString("dept_title"));
		m.setLocationId(rs.getString("location_id"));

		return m;
	}

}
