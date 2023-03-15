package com.objarr.controller;

public class Person {
	private String name;
	private int age;
	private String adress;
	private String phoneNum;

	public Person() {}
	
	public Person(String name,int age,String adress,String phoneNum) {
		this.name=name;
		this.age=age;
		this.adress=adress;
		this.phoneNum=phoneNum;				
	}
	
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return this.name;
	}
	
	public void setAge(int age) {
		this.age=age;
	}
	public int getAge() {
		return this.age;
	}
	
	public void setAdress(String adress) {
		this.adress=adress;
	}
	public String getAddress() {
		return this.adress;
	}
	
	public void setPhoneNum(String phoneNum) {
		this.phoneNum=phoneNum;
	}
	public String getPhoneNum() {
		return this.phoneNum;
	}
	
	public String infoPerson() {
		return this.name+" "+this.age+" "+this.adress+" "+this.phoneNum;
	}
}
