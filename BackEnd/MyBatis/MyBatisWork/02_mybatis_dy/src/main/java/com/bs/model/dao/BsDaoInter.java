package com.bs.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bs.model.vo.Board;
import com.bs.model.vo.Bs;
import com.bs.model.vo.Department;

public interface BsDaoInter {
	List<Bs> selectBsAll(SqlSession session,int cPage, int numPerpage);
	
	int selectBsCount(SqlSession session);
	
	List<Bs> searchBs(SqlSession session,Map<String,Object> param);
	
	List<Department> selectAllDept(SqlSession session);
	
	Board selectBoard(SqlSession session, int no);

}