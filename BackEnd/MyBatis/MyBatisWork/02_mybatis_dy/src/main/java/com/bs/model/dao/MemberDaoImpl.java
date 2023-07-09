package com.bs.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bs.model.vo.Member;

public class MemberDaoImpl implements MemberDao {

	@Override
	public List<Member> memberBoardComment(SqlSession session, int no) {		
		return session.selectList("member.memberBoardComment",no);
	}

}
