package com.web.member.service;

import static com.web.member.common.JDBCTemplate.*;
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
	
	public int insertMember(MemberDTO m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public MemberDTO selectByUserId(String userId) {
		Connection conn=getConnection();
		MemberDTO m=dao.selectByUserId(conn,userId);
		close(conn);
		return m;
	}
}
