package com.bs.hw.shape.controller;

import com.bs.hw.shape.model.vo.Shape;

public class SquareController {
	Shape sd=new Shape();
	public double calcPerimeter(double height,double width) {
		sd.setHeight(height);
		sd.setWidth(width);
		
		return (height+width)*2;
	}
	
	public double calcArea(double height,double width) {
		sd.setHeight(height);
		sd.setWidth(width);
		
		return height*width;
	}
	
	public void paintColor(String color) {
		sd.setColor(color);
	}
	
	public String print() {
		
		return "사각형"+sd.information();
	}

}
