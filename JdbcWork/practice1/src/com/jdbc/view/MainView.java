package com.jdbc.view;

import java.util.Scanner;

public class MainView {
	
	public void mainMenu() {
		Scanner sc=new Scanner(System.in);
		
		while(true) {
			System.out.println("1. 전체 사원조회");
			System.out.println("2. 사원 조회");
			System.out.println("3. 사원 등록");
			System.out.println("4. 사원 수정(직책, 부서, 급여, 전화번호, 이메일");
			System.out.println("5. 사원 삭제");
			System.out.println("6. 부서 관리");
			System.out.println("7. 직책 관리");
			System.out.println("0. 종료");
			int num=sc.nextInt();
			switch(num) {
			case 1 :
			case 0 : System.out.println("프로그램을 종료합니다.");return;	
			default : System.out.println("없는 메뉴입니다 다시 선택하세요"); 	
			}
		}
	}
	
	

}
