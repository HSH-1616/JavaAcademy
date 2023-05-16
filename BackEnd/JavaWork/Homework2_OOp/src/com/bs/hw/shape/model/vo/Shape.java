package com.bs.hw.shape.model.vo;

public class Shape {
	
	private int type;
	private double height;
	private double width;
	private String color="white";
	
	public Shape(){};
	
	public Shape(double height,double width)	{
		this.height=height;
		this.width=width;
	}
	
	public String information() {
		return this.height+" "+this.width+" "+this.color;		 
	}		
	
	public void setType(int type) {
		this.type=type;
	}
	public int getType() {
		return type;
	}
	
	public void setHeight(double height) {
		this.height=height;
	}	
	public double getHeight() {
		return height;
	}
	
	public void setWidth(double width) {
		this.width=width;
	}
	public double getWidth() {
		return width;
	}
	
	public void setColor(String color) {
		this.color=color;
	}
	public String getColor() {
		return color;
	}
	
	
	
	

}
