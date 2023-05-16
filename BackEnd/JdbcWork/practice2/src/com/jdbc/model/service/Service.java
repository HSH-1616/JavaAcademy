package com.jdbc.model.service;

import static com.jdbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.jdbc.model.dao.Dao;
import com.jdbc.model.dto.MemberDTO;

public class Service {
	
	Dao dao=new Dao();
	
	public List<MemberDTO> selectAllMember(){
		Connection conn=getConnection();
		List<MemberDTO> m=dao.selectAllMember(conn);
		close(conn);
		return m;		
	}
	
	public MemberDTO selectMemberId(String id) {
		Connection conn=getConnection();
		MemberDTO m=dao.selectMemberId(conn, id);
		close(conn);
		return m;
	}
	
	public List<MemberDTO> selectMemberName(String name) {
		Connection conn=getConnection();
		List<MemberDTO> m=dao.selectMemberName(conn, name);
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
}
