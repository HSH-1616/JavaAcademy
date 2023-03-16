package com.bs.hw.member.controller;

import com.bs.hw.member.model.vo.Member;

public class MemberController {	
	public int SIZE=10;
	private Member[] m =new Member[SIZE];
	 
			
	
	public int existMemberNum() {
		int count=SIZE;
		for(int i=0;i<m.length;i++) {
			if(m[i]==null) {
				count--;				
			}
		}
		return count;
	}
	
	public void insertMember(String id,String name, String password, String email, char gender, int age) {	
		
		for(int i=0;i<m.length;i++) {
			m[i].setId(id);
			m[i].setName(name);
			m[i].setPassword(password);
			m[i].setEmail(email);
			m[i].setGender(gender);
			m[i].setAge(age);				
		}		
	}

}
