package com.bs.variable;
import java.util.Scanner;

public class ScannerTest {
	public static void main(String[] args) {
		
	//사용자가 키보드로 입력한 값을 가져오기
	//java.util.Scanner클래스를 이용한다.
	//1. Scanner클래스를 import해주기 -> import java.util.Scanner;
	//2. Scanner클래스를 생성해준다. -> Scanner sc=new Scanner(System.in);
	Scanner sc=new Scanner(System.in);
	//3. Scanner클래스가 제공하는 기능을 이용해서 데이터를 받아오기
	//자료형에 따라 기능제공
	// 정수형 : nextInt()
	// 실수형 : nextDouble()
	// 문자형 : next() or nextLine()
	//입력받을 값에 대한 정보를 출력해줘야한다.
	System.out.print("취미 : ");
	String hobby=sc.next();
	System.out.println("당신의 취미 : " +hobby);
	
	System.out.print("당신의 나이 : ");
	int age=sc.nextInt();
	System.out.println("당신의 나이 : " +age);
	
	System.out.print("당신의 이름 : ");
	String name=sc.next();//입력한 문자열의 띄어쓰기를 기준으로 값을 가져온다.
	System.out.println("입력한 이름 : " +name);
	sc.nextLine();//버퍼를 비워주는 역할
	System.out.print("당신의 주소는 : ");
	String address=sc.nextLine();
	//입력한 문자열의 개행을 기준으로 값을 가져온다.
	System.out.println("입력한 주소 : " +address);
	
	System.out.print("키 : ");
	double height=sc.nextDouble();
	System.out.println("입력키 : "+height);
	
	
	//char타입 입력받기
	//성적등급, 성별
	System.out.print("성별(M/F) : ");
	char gender=sc.next().charAt(0);
	System.out.println("입력한 성별 : "+gender);
	
    }	

}
