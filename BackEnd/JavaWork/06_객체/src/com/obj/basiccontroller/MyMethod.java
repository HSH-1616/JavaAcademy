package com.obj.basiccontroller;

import java.util.Scanner;

import com.obj.model.vo.Employee;

public class MyMethod {
	
	public MyMethod() {}
	
	//"월요일 점심 맛있게 먹어요" 출력하는 메소드 작성하기
	public void printMsg() {
		System.out.println("월요일 점심 맛있게 먹어요");
	}
	//숫자를 1~5까지 더한수를 반환하는 메소드 작성하기
	public int sumNumber() {
		int sum=0;
		for(int i=0;i<5;i++) {
			sum+=(i+1);
		}
		return sum;
	}
	//사용자한테 5번 메세지를 입력받고 입력받은 메세지를 반환하는 메소드 만들기
	public String printMsgSum() {
		Scanner sc=new Scanner(System.in);
		String sumMsg="";
		for(int i=0;i<5;i++) {
			System.out.print((i+1)+"메세지 : ");
			sumMsg+=sc.nextLine();
		}
		return sumMsg;
	}
	//정수 두개, 연산자 한개를 전달받아 계산결과를 출력하는 메소드 만들기
	public void calculator(int su, int su2, char op) {
		switch(op) {
			case '+' : System.out.println(""+su+op+su2+"="+(su+su2));break;
			case '-' : System.out.println(""+su+op+su2+"="+(su-su2));break;
			case '*' : System.out.println(""+su+op+su2+"="+(su*su2));break;
			case '/' : System.out.println(""+su+op+su2+"="+(su/su2));break;
		}
	}
	//정수 두개, 연산자 한개를 전달받아 계산결과를 반환하는 메소드 만들기
	public double calculator2(int su, int su2, char op) {
//		double result=0;
//		switch(op) {
//			case '+' : result=su+su2;break;
//			case '-' : result=su-su2;break;
//			case '*' : result=su*su2;break;
//			case '/' : result=su/(double)su2;break;
//		}
//		return result;
		switch(op) {
			case '+' : return su+su2;
			case '-' : return su-su2;
			case '*' : return su*su2;
			case '/' : return su/(double)su2;
			//default : return 0;
		}
		return 0;
		
		
	}	
	//문자열을 전달받아 문자열에 중복값이 있는지 결과를 반환하는 메소드 만들기
	public boolean checkStr(String str) {
		//boolean flag=false;
		for(int i=0;i<str.length();i++) {
			for(int j=0;j<i;j++) {
				if(str.charAt(i)==str.charAt(j)) {
					return true;
//					flag=true;
//					break;
				}
			}
		}
		return false;
	}
	
	//Employee객체를 생성해주는 메소드 만들기
	
	public void makeEmployee(Employee e, String name,
			String department, int salary, double bonus) {		
		e.setName(name);
		e.setDepartment(department);
		e.setSalary(salary);
		e.setBonus(bonus);		
	}
	
	public Employee makeEmployee2(String name, String department, 
			int salary, double bonus) {
		Employee e=new Employee();
		e.setName(name);
		e.setDepartment(department);
		e.setSalary(salary);
		e.setBonus(bonus);
		return e;
	}
	
	
	
	
}
