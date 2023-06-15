package com.semi.productpage.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.semi.productpage.dao.ProductDao;
import com.semi.productpage.model.vo.Product;

public class ProductPageService {
	
	ProductDao dao=new ProductDao();
	
	public Product selectProduct(int id) {
		Connection conn=getConnection();
		Product result=dao.selectProduct(conn,id);
		close(conn);
		return result;		
	}
	
}
