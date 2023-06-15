package com.semi.productpage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductComment {
	
	private String userId;
	private int productId;
	private int commentNo;
	private int commentLevel;
	private String content;
	private int conmmentRef;
	private Date enrollDate;

}


//USER_ID VARCHAR2(25),
//PRODUCT_ID NUMBER,
//PRODUCT_COMMENT_NO NUMBER,
//PRODUCT_COMMENT_LEVEL NUMBER DEFAULT 1,         
//PRODUCT_COMMENT_CONTENT VARCHAR2(2000),          
//PRODUCT_COMMENT_REF NUMBER, 
//PRODUCT_COMMENT_DATE DATE DEFAULT SYSDATE, 