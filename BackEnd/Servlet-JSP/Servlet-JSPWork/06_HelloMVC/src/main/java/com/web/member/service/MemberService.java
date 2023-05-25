package com.web.member.service;

import static com.web.member.common.JDBCTemplate.close;
import static com.web.member.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.web.member.dao.MemberDao;
import com.web.member.dto.MemberDTO;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public MemberDTO checkMember(String userId, String password) {
		Connection conn=getConnection();
		MemberDTO m=dao.checkMember(conn,userId,password);
		close(conn);
		return m;		
	}
}
