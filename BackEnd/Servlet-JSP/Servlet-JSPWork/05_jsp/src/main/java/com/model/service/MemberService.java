package com.model.service;

import static com.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.model.dao.MemberDao;
import com.model.dto.MemberDTO;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public List<MemberDTO> selectMemberAll(){
		Connection conn=getConnection();
		List<MemberDTO> list=dao.selectMemberAll(conn);
		return list;
	}
	
	public List<MemberDTO> searchByName(String name){
		Connection conn=getConnection();
		List<MemberDTO> list=dao.searchByName(conn,name);
		close(conn);
		return list;
	}
}
