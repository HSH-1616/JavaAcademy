package com.bs.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.bs.common.SessionTemplate.*;
import com.bs.model.dao.BsDao;
import com.bs.model.vo.Bs;

public class BsService {
	
	private BsDao dao=new BsDao();
	
	public List<Bs> selectBsAll(int cPage, int numPerpage){
		SqlSession session=getSession();
		List<Bs> list=dao.selectBsAll(session,cPage,numPerpage);
		session.close();
		return list;
	}
	
	public int selectBsCount(){
		SqlSession session=getSession();
		int count=dao.selectBsCount(session);
		session.close();
		return count;
	}
}
