package com.bs.hw.employee.view;

import java.util.Scanner;

import com.bs.hw.employee.model.vo.Employee;

public class EmployeeMenu {
	Scanner sc=new Scanner(System.in);
	Employee e=new Employee();
	
	public EmployeeMenu() {
		
		int menuNum=0;
		
		System.out.println("1.사원 추가");
		System.out.println("2.사원 수정");
		System.out.println("3.사원 삭제");
		System.out.println("4.사원 출력");
		System.out.println("9.프로그램 종료");
		System.out.print("메뉴 번호를 누르세요 : ");
		menuNum=sc.nextInt();
		
		switch(menuNum) {
		case 1 : 
		}
		
	}
	
	public void insertEmp() {
		System.out.print("사원 번호 : ");
		int empNo=sc.nextInt();
		System.out.print("사원 이름 : ");
		String name=sc.next();
		System.out.print("사원 성별 : ");
		char gender=sc.next().charAt(0);
		System.out.print("전화 번호 : ");
		String phone=sc.next();
		System.out.print("추가 정보를 더 입력하시겠습니까?(y/n) : ");
		char go=sc.next().charAt(0);
		
		if(go=='y') {
			System.out.print("사원 부서 : ");
			String dept=sc.next();
			System.out.print("사원 연봉 : ");
			int salary=sc.nextInt();
			System.out.println("보너스 율 : ");
			double bonus=sc.nextDouble();
		}
	}

}
