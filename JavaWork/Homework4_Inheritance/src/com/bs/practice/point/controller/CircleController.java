package com.bs.practice.point.controller;

public class CircleController {
	
	public String calcCircum(int x, int y, int radious) {
		String circum="둘레 : "+x+", "+y+" ,"+radious+" / "+radious*2*Math.PI;
		return circum;
	}
	
	public String calcArea(int x, int y, int radious) {
		String calcArea="면적 : "+x+", "+y+" ,"+radious+"/ "+radious*radious*Math.PI;
		return calcArea;
	}

}
