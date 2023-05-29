package com.member.dao;

import static com.member.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.member.model.vo.Member;

public class MemberDao {
	
	private final Properties sql=new Properties();
	{
		String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member checkMember(Connection conn,String userId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
				
		try {
			pstmt=conn.prepareStatement(sql.getProperty("checkMember"));
			pstmt.setString(1,userId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}return m;
	}
	
	private Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.userId(rs.getString("userId"))
				.password(rs.getString("password"))
				.userName(rs.getString("userName"))
				.age(rs.getInt("age"))
				.gender(rs.getString("gender").charAt(0))
				.email(rs.getString("email"))
				.phone(rs.getString("phone"))
				.address(rs.getString("address"))
				.hobby(rs.getString("hobby").split(","))
				.enrollDate(rs.getDate("enrolldate"))
				.build();
	}
}
