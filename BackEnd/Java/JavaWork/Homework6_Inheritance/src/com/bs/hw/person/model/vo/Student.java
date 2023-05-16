package com.bs.hw.person.model.vo;

public class Student extends Person {

	private int grade;
	private String major;

	public Student() {

	}

	public Student(String name, int age, double height, double weight, int grade, String major) {
		super(name, age, height, weight);
		this.grade = grade;
		this.major = major;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getGrade() {
		return grade;
	}

	public void setMajor(String major) {
		this.major=major;
	}
	
	public String major() {
		return major;
	}

	@Override
	public String toString() {
		return "학생 이름 : "+getName()+" /학생 나이 : "+getAge()+" /학생 키 : "+getHeight()
		+" /학생 몸무게 : "+getWeight()+" /학생 학년 : "+grade+" /학생 전공 : "+major;
	}

}
