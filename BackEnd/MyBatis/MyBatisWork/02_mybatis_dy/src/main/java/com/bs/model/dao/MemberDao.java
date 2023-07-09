package com.bs.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bs.model.vo.Member;

public interface MemberDao {
	List<Member> memberBoardComment(SqlSession session, int no);
}
