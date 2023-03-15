package com.obj.practice;

public class Student {
	
	private int grade;
	private int classroom;
	private String name;
	private double height;
	private char gender;
	
	public void information() {
		grade=1;
		classroom=4;
		name="허성현";
		height=173.2;
		gender='남';
		System.out.println(grade+" "+classroom+" "+name+" "+height+" "+gender);
	}	
}
