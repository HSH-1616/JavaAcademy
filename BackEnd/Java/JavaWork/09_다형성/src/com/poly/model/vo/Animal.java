package com.poly.model.vo;

public abstract class Animal {
	private String name;
	private String type;
	private int age;
	public Animal() {
		
	}
	public Animal(String name, String type, int age) {
		super();
		this.name = name;
		this.type = type;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}		
	
	//자식 클래스에서 반드시 구현해야할 메소드가 있다면 
	//abstaract예약어를 사용해서 처리한다.
	//1. 메소드의 선언문만 작성함.
	//2. 구현부는 자식클래스에서 구현을 한다. -> 자식 클래스가 Override에서 구현
	

//	public void bark() {
//		System.out.println("울음소리!");
//	}

	public abstract void bark();
}
