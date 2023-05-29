package com.member.service;

import static com.member.common.JDBCTemplate.close;
import static com.member.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.member.dao.MemberDao;
import com.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public Member checkMember(String userId, String password) {
		Connection conn=getConnection();
		Member m=dao.checkMember(conn,userId,password);
		close(conn);
		return m;
	}
	
	
}
