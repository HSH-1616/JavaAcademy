package com.inherit.model.vo;

import java.util.Objects;

public class Student extends Person{
	//이름, 나이, 성별, 전화번호, 주소
	//수강과목, 특이사항, 수준
	private String joinClass;
	private String issue;
	private char level;
	
	public Student() {
		// TODO Auto-generated constructor stub
	}
	//슈퍼클래스 alt+s+a	
	public Student(String name, int age, char gender, String phone, String address, String joinClass, String issue, char level) {
		super(name,age,gender,phone,address);
		this.joinClass = joinClass;
		this.issue = issue;
		this.level = level;
	}

	public String getJoinClass() {
		return joinClass;
	}

	public void setJoinClass(String joinClass) {
		this.joinClass = joinClass;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public char getLevel() {
		return level;
	}

	public void setLevel(char level) {
		this.level = level;
	}
	
	public String infoStudent() {
		return infoPerson()+" "+joinClass+" "+issue+" "+level;
	}
	
	@Override
	public String info() {
		return infoStudent();
	}
	@Override
	public boolean equals(Object o) {
		//객체의 동등성비교를 하기위해 설정
		//필드의 값을 가지고 생성된 값이 같은지 비교하기 위해
		Student s=(Student)o;
		if(getName().equals(s.getName())
				&&getAge()==s.getAge()
				&&getGender()==s.getGender()
				&&getAddress().equals(s.getAddress())
				&&getPhone().equals(s.getPhone())
				&&joinClass.equals(s.joinClass) 
				)return true;
					
		return false;
	}
	
	//toString Override하기
	@Override
	public String toString() {
		return getName()+" "+getAge()+" "+getGender()+" "+getPhone()+" "+getAddress()+" "+joinClass+" "+issue+" "+level;
	}
	@Override
	public int hashCode() {
		//equals에서 동등비교의 기준이 된 필드를 매개변수로 넣으면됨
		return Objects.hash(getName(),getAge(),getGender(),getPhone(),getAddress(),joinClass);
	}
	
	@Override
	public Student clone() {
		return new Student(getName(),getAge(),getGender(),getPhone(),getAddress(),joinClass,issue,level);
	}
}
