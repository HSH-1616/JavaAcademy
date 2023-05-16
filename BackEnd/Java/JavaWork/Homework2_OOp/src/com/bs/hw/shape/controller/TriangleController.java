package com.bs.hw.shape.controller;

import com.bs.hw.shape.model.vo.Shape;

public class TriangleController {
	Shape sh=new Shape();
	
	public double calcArea(double height,double width) {
			
		sh.setHeight(height);
		sh.setWidth(width);
	
		return height*width/2;
	}
	
	public void paintColor(String color) {
		
		sh.setColor(color);
		
	}
	
	public String print() {

		return "삼각형"+sh.information();
	}

}
