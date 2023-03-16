package com.bs.hw.member.view;

import java.util.Scanner;

import com.bs.hw.member.controller.MemberController;

public class MemberMenu {
	Scanner sc=new Scanner(System.in);
	MemberController mc=new MemberController();	
	
	public void mainMenu() {
		System.out.println("최대 등록 가능한 회원수는 " +mc.SIZE+"명 입니다.");
		System.out.println("현재 등록된 회원 수는 "+mc.existMemberNum()+"명 입니다.");
		
		int menuNum;
		if(mc.existMemberNum()!=mc.SIZE) {
			System.out.println("1. 새 회원 등록");
			System.out.println("2. 회원 검색");
			System.out.println("3. 회원 정보 수정");
			System.out.println("4. 회원 삭제");
			System.out.println("5. 모두 출력");
			System.out.println("9. 끝내기");
			System.out.print("메뉴 번호 :");
			menuNum=sc.nextInt();
			
			switch(menuNum) {
			case 1 : 
			}
			
		}else if(mc.existMemberNum()==mc.SIZE) {
			System.out.println("회원 수가 모두 꽉 찼기 때문에 일부 메뉴만 오픈됩니다.");
			System.out.println("2. 회원 검색");
			System.out.println("3. 회원 정보 수정");
			System.out.println("4. 회원 삭제");
			System.out.println("5. 모두 출력");
			System.out.println("9. 끝내기");
			System.out.print("메뉴 번호 :");
		}		
	}
	
	public void insertMemeber() {
		
		for (int i=0;i<)
		System.out.println("새 회원을 등록합니다.");
		System.out.print("아이디 : ");
		m[].setId(sc.next());
	}

}
