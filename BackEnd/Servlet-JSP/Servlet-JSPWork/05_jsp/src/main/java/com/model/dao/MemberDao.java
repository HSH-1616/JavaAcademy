package com.model.dao;

import static com.jsp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.dto.MemberDTO;

public class MemberDao {
	
	public List<MemberDTO> selectMemberAll(Connection conn){
		String sql="SELECT * FROM MEMBER";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDTO> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO m=MemberDTO.builder()
						.memberId(rs.getString("member_id"))
						.memberPwd(rs.getString("member_pwd"))
						.memberName(rs.getString("member_name"))
						.age(rs.getInt("age"))
						.gender(rs.getString("gender"))
						.email(rs.getString("email"))
						.phone(rs.getString("phone"))
						.address(rs.getString("address"))
						.hobby(rs.getString("hobby"))
						.enrollDate(rs.getDate("enroll_date"))
						.build();
					list.add(m);
				}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<MemberDTO> searchByName(Connection conn, String name){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEMBER WHERE MEMBER_NAME LIKE ?";
		List<MemberDTO> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+name+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO m=MemberDTO.builder()
						.memberId(rs.getString("member_id"))
						.memberPwd(rs.getString("member_pwd"))
						.memberName(rs.getString("member_name"))
						.age(rs.getInt("age"))
						.gender(rs.getString("gender"))
						.email(rs.getString("email"))
						.phone(rs.getString("phone"))
						.address(rs.getString("address"))
						.hobby(rs.getString("hobby"))
						.enrollDate(rs.getDate("enroll_date"))
						.build();
					list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);			
		}return list;
	}
}
