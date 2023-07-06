package com.bs.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bs.model.vo.Bs;

public class BsDao {
	
	public List<Bs> selectBsAll(SqlSession session,int cPage,int numPerpage){
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("bs.selectBsAll",null,rb);
	}
	
	public int selectBsCount(SqlSession session) {
		// selectOne()메소드를 이용해서 데이터를 조회할 수 있다.
		int result = session.selectOne("bs.selectBsCount");
		return result;
	}
}
