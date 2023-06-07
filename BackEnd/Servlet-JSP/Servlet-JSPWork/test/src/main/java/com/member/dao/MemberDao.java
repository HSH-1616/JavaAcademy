package com.member.dao;

import static com.member.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.member.model.Member;

public class MemberDao {
	
	public int insertMember(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,SYSDATE)";
		try {			
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1,m.getUserId());
			pstmt.setString(2,m.getUserPwd());
			pstmt.setString(3,m.getUserName());
			pstmt.setString(4,String.valueOf(m.getGender()));
			pstmt.setInt(5,m.getAge());
			pstmt.setString(6,m.getEmail());
			pstmt.setString(7,m.getPhone());
			pstmt.setString(8,m.getAddress());
			pstmt.setString(9,String.join(",",m.getHobby()));
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}		
		return result;
	}
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.userId(rs.getString("userId"))
				.userPwd(rs.getString("password"))
				.userName(rs.getString("userName"))
				.age(rs.getInt("age"))
				.gender(rs.getString("gender").charAt(0))
				.email(rs.getString("email"))
				.phone(rs.getString("phone"))
				.address(rs.getString("address"))
				.hobby(rs.getString("hobby")!=null?rs.getString("hobby").split(","):null)
				.enrollDate(rs.getDate("enrolldate"))
				.build();
	}

}
