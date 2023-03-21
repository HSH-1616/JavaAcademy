package com.bs.practice.point.controller;

public class RectangleController {
	
	public String calcPerimeter(int x, int y, int height, int width) {
		String perimeter="둘레 : "+x+", "+y+" ,"+height+" ,"+width+"/ "+(height+width)*2;
		return perimeter;
	}
	
	public String calcArea(int x, int y, int height, int width) {
		String area="둘레 : "+x+", "+y+" ,"+height+" ,"+width+"/ "+(height*width);
		return area;
	}

}
