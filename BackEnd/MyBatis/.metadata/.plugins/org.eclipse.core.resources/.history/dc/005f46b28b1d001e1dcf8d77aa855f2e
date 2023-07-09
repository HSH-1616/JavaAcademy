package com.bs.model.service;

import static com.bs.common.SessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bs.model.dao.BsDao;
import com.bs.model.dao.BsDaoImpl;
import com.bs.model.vo.Bs;

public class BsServiceImpl implements BsServiceInter {
	private BsDaoImpl dao=new BsDaoImpl();
	@Override
	public List<Bs> selectBsAll(int cPage, int numPerpage) {
		SqlSession session=getSession();
		List<Bs> list=dao.selectBsAll(session,cPage,numPerpage);
		session.close();
		return list;
	}
	@Override
	public int selectBsCount() {
		SqlSession session=getSession();
		int count=dao.selectBsCount(session);
		session.close();
		return count;
	}

	@Override
	public List<Bs> searchBs(Map<String, Object> param) {
		SqlSession session=getSession();
		List<Bs> list=dao.searchBs(session,param);
		session.close();
		return list;
	}

}
