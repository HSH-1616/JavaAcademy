package com.bs.practice.func;
import java.util.Scanner;

public class OperatorPractice {
	public void practice1() {
		Scanner sc=new Scanner(System.in);
		System.out.print("정수 : ");
		int num=sc.nextInt();
		System.out.println(num>0?"양수다":"양수가 아니다");
				
	}

	public void practice2() {
		Scanner sc=new Scanner(System.in);
		System.out.print("정수 : ");
		int num=sc.nextInt();
		System.out.println(num>0?"양수다":num==0?"0이다":"음수다");
				
	}
	
	public void practice3() {
		Scanner sc=new Scanner(System.in);
		System.out.print("정수 : ");
		int num=sc.nextInt();
		System.out.println(num%2==0?"짝수다":"홀수다");
		
	}
	
	public void practice4() {
		Scanner sc=new Scanner(System.in);
		System.out.print("인원수 : ");
		int people=sc.nextInt();
		System.out.print("사탕 개수 : ");
		int candy=sc.nextInt();
		System.out.println("1인당 사탕 개수 : "+candy/people+"\n"+"남는 사탕 개수 : "+candy%people);
		
	}
	
	public void practice5() {
		Scanner sc=new Scanner(System.in);
		System.out.print("이름 : ");
		String name=sc.next();
		System.out.print("학년(숫자만) : ");
		int grade=sc.nextInt();
		System.out.print("반(숫자만) : ");
		int classNum=sc.nextInt();
		System.out.print("번호(숫자만) : ");
		int stuNum=sc.nextInt();
		System.out.print("성별(M/F) : ");
		char gender=sc.next().charAt(0);
		System.out.print("성적(소수점 아래 둘째자리까지) : ");
		double result=sc.nextDouble();
		
		System.out.println(grade+"학년 "+classNum+"반 "+stuNum+"번 "+name+" "+(gender=='M'?"남학생":"여학생")+"의 성적은 "+result+"이다");
				
	}
	
	public void practice6() {
		Scanner sc=new Scanner(System.in);
		System.out.print("나이 : ");
		int age=sc.nextInt();
		System.out.println(age<=13?"어린이":13<age&&age<=19?"청소년":"성인");
		
	}
	
	public void practice7() {
		Scanner sc=new Scanner(System.in);
		System.out.print("국어 : ");
		int kor=sc.nextInt();
		System.out.print("영어 : ");
		int eng=sc.nextInt();
		System.out.print("수학 : ");
		int math=sc.nextInt();
		int score=kor+eng+math;
		System.out.println("합계 : "+score+"\n"+"평균 : "+(score/3)+"\n"+(kor>=40&&eng>=40&&math>=40&&score/3>=60?"합격":"불합격"));
		
	}
	
	public void practice8( ) {
		Scanner sc=new Scanner(System.in);
		System.out.print("주민번호를 입력하세요(- 포함) : ");
		String msg=sc.nextLine();
		System.out.println(msg.charAt(7));
		System.out.println(msg.charAt(7)=='1'||msg.charAt(7)=='3'?"남자":msg.charAt(7)=='2'||msg.charAt(7)=='4'?"여자":"누구세요");
		
	}
	
	public void practice9() {
		Scanner sc=new Scanner(System.in);
		System.out.print("정수1 : ");
		int num1=sc.nextInt();
		System.out.print("정수2 : ");
		int num2=sc.nextInt();
		System.out.print("입력 : ");
		int num3=sc.nextInt();
		System.out.println(num3<=num1||num3>num2?true:false);
		
	}
	
	public void practice10() {
		Scanner sc=new Scanner(System.in);
		System.out.print("입력 1 : ");
		int num1=sc.nextInt();
		System.out.print("입력 2 : ");
		int num2=sc.nextInt();
		System.out.print("입력 3 : ");
		int num3=sc.nextInt();
		System.out.println(num1==num2&&num1==num3?true:false);
				
	}
	
	public void practice11() {
		Scanner sc=new Scanner(System.in);
		System.out.print("A사원의 연봉 : ");
		int moneyA=sc.nextInt();
		System.out.print("B사원의 연봉 : ");
		int moneyB=sc.nextInt();
		System.out.print("C사원의 연봉 : ");
		int moneyC=sc.nextInt();
		System.out.println("A사원의 연봉/연봉+a : "+moneyA+"/"+(moneyA*1.4)+"\n"+(moneyA*1.4>=3000?"3000 이상":"3000 미만")
		+"\n"+"B사원의 연봉/연봉+a : "+moneyB+"/"+moneyB+"\n"+(moneyB>=3000?"3000 이상":"3000 미만")
		+"\n"+"C사원의 연봉/연봉+a : "+moneyC+"/"+(String.format("%.1f",moneyC*1.15))+"\n"+(moneyC*1.15>=3000?"3000 이상":"3000 미만"));
	}
	
}
