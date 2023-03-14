package com.obj.basiccontroller;

import java.util.Scanner;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class MyMethod {
	Scanner sc=new Scanner(System.in);

	//com.obj.basiccontroller.MyMethod
	
	//"월요일 점심 맛있게 먹어요" 출력하는 메소드 작성하기
	
	//숫자를 1~5까지 더한수를 반환하는 메소드 작성하기

	//사용자한테 5번 메세지를 입력받고 입력받은 메세지를 반환하는 메소드 만들기

	//정수 두개, 연산자 한개를 전달받아 계산결과를 출력하는 메소드 만들기
	
	//정수 두개, 연산자 한개를 전달받아 계산결과를 반환하는 메소드 만들기

	//문자열을 전달받아 문자열에 중복값이 있는지 결과를 반환하는 메소드 만들기

	public void lunch() {
		System.out.println("월요일 점심 맛있게 먹어요");
	}
	
	public int calc() {
		int num=0;
		for(int i=1;i<=5;i++) {
			num+=i;
		}
		return num;
	}
	
	public void msg() {
		String msg="";
		for(int i=0;i<5;i++) {
		System.out.print("입력 : ");
		msg+=sc.nextLine()+" ";
		}
		System.out.println(msg);
		sc.nextLine();
	}
	
	public void calc1(int num, int num2, char yeon){
		System.out.print("정수1 : "+num);
		System.out.print("\n정수2 : "+num2);
		System.out.println("\n연산자 : "+yeon);
	
		
		switch(yeon) {
		case '+' : System.out.println(num+num2);break;
		case '-' : System.out.println(num-num2);break;
		case '*' : System.out.println(num*num2);break;
		case '/' : System.out.println(num/num2);break;
		case '%' : System.out.println(num%num2);break;
		}
	}
	
	
}
