package com.web.admin.service;

import static com.web.member.common.JDBCTemplate.close;
import static com.web.member.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.web.admin.dao.AdminDao;
import com.web.member.dto.MemberDTO;

public class AdminService {
	
private AdminDao dao=new AdminDao();
	
	public List<MemberDTO> memberList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<MemberDTO> m=dao.memberList(conn,cPage,numPerpage);
		close(conn);
		return m;		
	}
	
	public int selectMemberCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn);
		close(conn);
		return result;
	}
	
	public List<MemberDTO> selectMemberByKeyword(String type, String keyword,int cPage, int numPerPage){
		Connection conn=getConnection();
		List<MemberDTO> memberList=dao.selectMemberByKeyword(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return memberList;
	}
	public int selectMemberByKeywordCount(String type,String keyword) {
		Connection conn=getConnection();
		int count=dao.selectMemberByKeywordCount(conn,type,keyword);
		close(conn);
		return count;
	}
}
