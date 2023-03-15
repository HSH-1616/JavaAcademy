package com.obj.practice;

public class Circle {

	private double Pi=3.14;
	private int radius=1;
	
	public void getAreaOfCircle() {
		System.out.println((radius*radius)*Pi);
	}
	
	public void getSizeOfCircle() {
		System.out.println((radius*2)*Pi);
	}
	
	public void incrementRadius() {
		radius++;
	}
}
