package com.jdbc.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jdbc.model.dto.MemberDTO;
import static com.jdbc.common.JDBCTemplate.*;

public class Dao {

	private Properties sql = new Properties();

	{
		String path = Dao.class.getResource("/sql/member/member_sql.properties").getPath();
		try (FileReader fr = new FileReader(path);) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<MemberDTO> selectAllMember(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		List<MemberDTO> m = new ArrayList();
		String sql = this.sql.getProperty("selectMemberAll");
//		String sql="SELECT * FROM MEMBER";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next())
				m.add(getMember(rs));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return m;
	}

	public MemberDTO selectMemberId(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO m = null;
		String sql = this.sql.getProperty("selectMemberId");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				m = getMember(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public List<MemberDTO> selectMemberName(Connection conn,String name){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDTO> m=new ArrayList();
		String sql=this.sql.getProperty("selectMemberName");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+name+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
				m.add(getMember(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;		
	}
	
	public int insertMember(Connection conn,MemberDTO m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=this.sql.getProperty("insertMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getMemberPwd());
			pstmt.setString(3,m.getMemberName());
			pstmt.setString(4,m.getEmail());
			pstmt.setString(5,m.getAddress());
			pstmt.setString(6,m.getPhone());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	private MemberDTO getMember(ResultSet rs) throws SQLException {
		MemberDTO m = new MemberDTO();
		m.setIdxNumber(rs.getInt("idx_number"));
		m.setMemberId(rs.getString("member_id"));
		m.setMemberPwd(rs.getString("member_pwd"));
		m.setMemberName(rs.getString("member_name"));
		m.setEmail(rs.getString("email"));
		m.setAddress(rs.getString("address"));
		m.setPhone(rs.getString("phone"));
		m.setEnrollDate(rs.getDate("enroll_date"));

		return m;
	}

}
