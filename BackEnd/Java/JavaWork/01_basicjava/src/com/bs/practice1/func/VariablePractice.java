package com.bs.practice1.func;
import java.util.Scanner;


public class VariablePractice {
	public void practice1() {
		Scanner sc=new Scanner(System.in);
		System.out.print("이름을 입력하세요 : ");
		String name = sc.next();
		System.out.print("성별을 입력하세요(남/여) : ");
		char gender=sc.next().charAt(0);
		System.out.print("나이를 입력하세요 : ");
		int age=sc.nextInt();
		sc.nextLine();
		System.out.print("키를 입력하세요(cm) : ");
		String height=sc.nextLine();
		
		System.out.print("키 "+height+"cm"+"인 "+age+"살 "+gender+"자 "+name+"님 반갑습니다 ^^");
	
	}
	
	public void practice2() {
		Scanner sc=new Scanner(System.in);
		System.out.print("첫번째 정수 : ");
		int su1 = sc.nextInt();
		System.out.print("두번째 정수 : ");
		int su2 = sc.nextInt();
		System.out.println("더하기 결과 : "+(su1+su2)+"\n"+"빼기 결과 : "+(su1-su2)+"\n"+"곱하기 결과 : "+(su1*su2)+"\n"+"나누기 결과 : "+(su1/su2));
				
	}

	public void practice3() {
		Scanner sc=new Scanner(System.in);
		System.out.print("가로 : ");
		double width=sc.nextDouble();
		System.out.print("세로 : ");
	    double length=sc.nextDouble();
	    System.out.println("면적 : "+(width*length)+"\n"+"둘레 : "+((width+length))*2);
		
	}
	
	public void practice4() {
		Scanner sc=new Scanner(System.in);
		System.out.print("문자열을 입력하세요 : ");
		String str=sc.nextLine();
		System.out.println("첫번째 문자 : "+str.charAt(0)+"\n"+"두번째 문자 : "+str.charAt(1)+"\n"+"세번째 문자 : "+str.charAt(2));
	}
	
}
