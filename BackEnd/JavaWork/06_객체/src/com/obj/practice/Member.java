 package com.obj.practice;

public class Member {

	private String memberId;
	private String memberPwd;
	private String memberName;
	private int age;
	private char gender;
	private String phone;
	private String email;
		
	public void changeName(String name) {
		this.memberName=name;
	}		
	
	public void printName() {
		System.out.println(memberName);
	}
	

	

}
