package com.bs.practice.point.model.vo;

public class Circle extends Point {

	private int radious;
	public Circle() {		
	}
	
	public Circle(int x, int y, int radious ) {
		super(x,y);
		this.radious=radious;		
	}
	
	public void setRadious(int radious) {
		this.radious=radious;
	}
	
	public int getRadious() {
		return radious;
	}
	@Override
	public String toString() {
		return getX()+" "+getY()+" "+radious;
	}
}
