package com.obj.practice;

public class Product2 {
	
	private String pName;
	private int price;
	private String brand;
	
	public void information() {
		System.out.println(pName+" "+price+" "+brand);
	}
	
	public void setpName(String pName) {
		this.pName=pName;
	}
	public String getpName() {
		return pName;
	}
	
	public void setPrice(int price)	{
		this.price=price;
	}
	public int getPrice() {
		return price;
	}
	
	public void setBrand(String brand) {
		this.brand=brand;
	}
	public String getBrand() {
		return brand;
	}
	
	

}
