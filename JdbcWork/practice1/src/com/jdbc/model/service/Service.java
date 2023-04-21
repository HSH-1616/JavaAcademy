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

}
