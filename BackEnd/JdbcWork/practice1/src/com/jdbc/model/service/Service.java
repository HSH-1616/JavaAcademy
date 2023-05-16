package com.jdbc.model.service;

import java.sql.Connection;
import java.util.List;

import com.jdbc.model.dao.ModelDao;
import com.jdbc.model.dto.ModelDTO;

import static com.jdbc.common.JDBCTemplate.*;

public class Service {
	
	private ModelDao dao=new ModelDao();
	
	public List<ModelDTO> selectAllMember(){
		Connection conn=getConnection();
		List<ModelDTO> m=dao.selectAllMember(conn);
		close(conn);
		return m;		
	}
	
	public List<ModelDTO> selectEmp(String[] total){
		Connection conn=getConnection();
		List<ModelDTO> m=dao.selectEmp(conn,total);
		close(conn);
		return m;
	}
	
	public int insertEmp(ModelDTO m) {
		Connection conn=getConnection();
		int result=dao.insertEmp(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		
	}
	
	public int updateEmp(ModelDTO m) {
		Connection conn=getConnection();
		int result=dao.updateEmp(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteEmp(int num) {
		Connection conn=getConnection();
		int result=dao.deleteEmp(conn, num);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int selectDept(List arr) {
		Connection conn=getConnection();
		int result=dao.selectDept(conn, arr);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
