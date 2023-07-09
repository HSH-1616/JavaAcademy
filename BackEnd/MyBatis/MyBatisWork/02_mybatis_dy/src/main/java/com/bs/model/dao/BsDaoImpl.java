package com.bs.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bs.model.vo.Board;
import com.bs.model.vo.Bs;
import com.bs.model.vo.Department;

public class BsDaoImpl implements BsDaoInter {

	@Override
	public List<Bs> selectBsAll(SqlSession session, int cPage, int numPerpage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerpage, numPerpage);
		return session.selectList("bs.selectBsAll", null, rb);
	}

	@Override
	public int selectBsCount(SqlSession session) {
		int result = session.selectOne("bs.selectBsCount");
		return result;
	}

	@Override
	public List<Bs> searchBs(SqlSession session, Map<String, Object> param) {
		return session.selectList("bs.searchBs", param);
	}
	
	@Override
	public List<Department> selectAllDept(SqlSession session){
		return session.selectList("bs.selectAllDept");
	}
	
	@Override
	public Board selectBoard(SqlSession session,int no){
		return session.selectOne("member.selectBoard",no);
	}
}
