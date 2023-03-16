package com.bs.hw.member.model.vo;

public class Member {
	private String id;
	private String name;
	private String password;
	private String email;
	private char gender;
	private int age;

	Member() {
	}
	
	Member(String id,String name,String password,String email,char gender,int age){
		this.id=id;
		this.name=name;
		this.password=password;
		this.email=email;
		this.gender=gender;
		this.age=age;		
	}
	
	public void setId(String id) {
		this.id=id;
	}
	public String getId() {
		return id;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public String getPassword() {
		return password;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	public void setGender(char gender) {
		this.gender=gender;
	}
	public char getGender() {
		return gender;
	}
	public void setAge(int age) {
		this.age=age;
	}
	public int getAge() {
		return age;
	}
	
	public String inform() {
		return this.id+" "+this.name+" "+this.password+" "+this.email+" "+this.gender+" "+this.age;
	}




}
