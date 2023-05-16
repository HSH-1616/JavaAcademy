package com.poly.model.vo;

public class Cat extends Animal {
	
	public Cat() {
		
	}
	
	public Cat(String name, String type, int age) {
		super(name,type,age);
	}
	
	public String catbark() {
		return "야옹 야옹!";
	}
	@Override
	public void bark() {
		System.out.println(catbark());
	}

}
