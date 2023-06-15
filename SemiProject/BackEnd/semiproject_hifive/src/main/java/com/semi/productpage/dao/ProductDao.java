package com.semi.productpage.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.semi.common.JDBCTemplate.*;
import com.semi.productpage.model.vo.Product;

public class ProductDao {

	private Properties sql = new Properties();

	public ProductDao() {
		String path=ProductDao.class.getResource("/sql/productpage/productpagesql.properties").getPath();
		try(FileReader fr=new FileReader(path);){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Product selectProduct(Connection conn, int id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Product p=null;
		String sql=this.sql.getProperty("selectProduct");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				p=getProduct(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return p;
		
	}

	
	public static Product getProduct(ResultSet rs) throws SQLException{
		return Product.builder()
				.productId(rs.getInt("product_id"))
				.userId(rs.getString("user_id"))
				.title(rs.getString("product_title"))
				.status(rs.getString("product_status"))
				.sellStatus(rs.getString("sell_status"))
				.price(rs.getInt("price"))
				.registTime(rs.getDate("regist_time"))
				.viewCount(rs.getInt("view_count"))
				.explanation(rs.getString("explanation"))
				.keyword(rs.getString("keyword")!=null?rs.getString("keyword").split(","):null)
				.category(rs.getString("category_name"))
				.subCategory(rs.getString("subcategory_name"))
				.areaId(rs.getInt("goonguarea_id"))
				.build();
	}
}
