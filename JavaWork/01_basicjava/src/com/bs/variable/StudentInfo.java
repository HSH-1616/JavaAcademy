package com.bs.variable;
import java.util.Scanner;

//학생정보를 입력받고 출력하는 기능 구현하기
	//이름, 나이, 성별(남,여), 학년, 반, 번호, 키, 이메일 입력받고 입력 받은 내용을 출력하기
	//com.bs.variable.StudentInfo클래스를 생성해서 구현할것.
	//1. 입력받은 값을 출력
	//2. 한번에 출력
	// 허성현 26 남 1 4 38 173.3 서울시 마포구 abc@naver.com

public class StudentInfo {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		
		System.out.print("당신의 이름 : ");
		String name=sc.nextLine();
		System.out.println("입력한 이름 : " +name);
		
		System.out.print("당신의 나이 : ");
		int age=sc.nextInt();
		System.out.println("입력한 나이 : " +age+"세");
		
		System.out.print("당신의 성별 : ");
		char gender=sc.next().charAt(0);
		System.out.println("입력한 성별 : " +gender);
		
		System.out.print("당신의 학년 : ");
		int grade=sc.nextInt();
		System.out.println("입력한 학년 : " +grade+"학년");
		
		System.out.print("당신의 반 : ");
		int cla$$ =sc.nextInt();
		System.out.println("입력한 반 : " +cla$$+"반");
		
		System.out.print("당신의 번호 : ");
		int number =sc.nextInt();
		System.out.println("입력한 번호 : " +number+"번");
		
		System.out.print("당신의 키 : ");
		double height =sc.nextDouble();
		System.out.println("입력한 키 : " +height+"cm");
		
		sc.nextLine();//버퍼 제거
		
		System.out.print("당신의 주소 : ");
		String adress=sc.nextLine();
		System.out.println("입력한 주소 : "+adress);
		
		System.out.print("당신의 이메일 : ");
		String email=sc.nextLine();
		System.out.println("입력한 이메일 : "+email);
		
		String print ="\n"+ "이름 : "+name+ "\n"+ "나이 : " +age+"세"+"\n"+ "성별 : " +gender+ "\n"+ "학년 : " +grade+"학년"+ "\n"+ "반 : " +cla$$+"반"+ "\n"+ 
		"번호 : " +number+"번"+ "\n"+ "키 : " +height+"cm"+ "\n"+ "주소 : " +adress+ "\n"+ "이메일 : "+email;
		System.out.print(print);
	}

}
