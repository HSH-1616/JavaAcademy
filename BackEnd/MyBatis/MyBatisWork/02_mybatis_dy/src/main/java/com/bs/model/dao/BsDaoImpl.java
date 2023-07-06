package com.bs.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bs.model.vo.Bs;

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

}
