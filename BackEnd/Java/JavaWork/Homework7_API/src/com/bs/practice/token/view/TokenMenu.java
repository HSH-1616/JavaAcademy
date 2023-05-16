package com.bs.practice.token.view;

import java.util.Scanner;

import com.bs.practice.token.controller.TokenController;

public class TokenMenu {
	
	TokenController tc=new TokenController();
	Scanner sc = new Scanner(System.in);
	
	public void mainMenu() {
		
		int menuNum = 0;

		while (menuNum != 3) {
			System.out.println("1.지정 문자열\n2.입력 문자열\n3.프로그램 끝내기");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();
			sc.nextLine();
			switch (menuNum) {
			case 1: tokenMenu();break;
			case 2:	inputMenu();break;
			case 3:
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
				menuNum = 0;
			}
		}
	}
	
	public void tokenMenu() {
		String str="J a v a P r o g r a m ";
		
		System.out.println("토큰 처리 전 글자 : "+str);
		System.out.println("토큰 처리 전 개수 : "+str.length());		
		System.out.println("토큰 처리 후 글자 : "+tc.afterToken(str));
		System.out.println("토큰 처리 후 개수 : "+tc.afterToken(str).length());
		System.out.println("모두 대문자로 변환 : "+tc.afterToken(str).toUpperCase()+"\n");		
	}
	
	public void inputMenu() {
		
		System.out.print("문자열을 입력하세요 : ");
		String str=sc.nextLine();
		System.out.print("찾을 문자를 하나 입력하세요 : ");
		char ch=sc.next().charAt(0);
		
		System.out.println("첫 글자 대문자 : "+tc.firstCap(str));						
		System.out.println(ch+" 문자가 들어간 개수 : "+tc.findChar(str, ch)+"\n");
		
		
	}

}
