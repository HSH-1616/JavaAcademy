package com.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	private int productId;
	private String userId;
	private String Title;
	private String Status;
	private int Price;
	private Date registTime;
	private int count;
	private String explanation;
	private String keyword;
	private int shopId;
	private int categoryId;
	private int areaId;
}
