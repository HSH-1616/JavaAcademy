package com.rsp;
import java.util.Scanner;
import java.util.Random;

public class RSP {
	
public static void main(String[] args) {
	Scanner sc=new Scanner(System.in);
	Random r=new Random();
	
	
	int cWin=0;
	int uWin=0;
	String result=" ";	
	
	while(!result.equals("exit")) {		
		System.out.println("==== 가위 바위 보 게임 ====\n1.가위\n2.바위\n3.보\nexit.종료");
		System.out.print("입력 : ");		
		String rsp=sc.next();
		int i=r.nextInt(3)+1;
		
		if(rsp.equals("exit")) {
			System.out.println("프로그램 종료");
			System.out.println("사용자 승 "+uWin+"번 "+"컴퓨터 승 "+cWin+"번");
			result="exit";
			
		}else if(i==1&&rsp.equals("3")) {
			System.out.println("컴퓨터가 이겼습니다.");
			System.out.println("다시 하겠습니다.");
			cWin++;
				
		}else if(i==2&&rsp.equals("1")) {
			System.out.println("컴퓨터가 이겼습니다.");
			System.out.println("다시 하겠습니다.");
			cWin++;
		
		}else if(i==3&&rsp.equals("2")) {
			System.out.println("컴퓨터가 이겼습니다.");
			System.out.println("다시 하겠습니다.");
			cWin++;
			
		}else if(rsp.equals("1")&&i==3) {
			System.out.println("사용자가 이겼습니다.");
			System.out.println("다시 하겠습니다.");
			uWin++;
			
		}else if(rsp.equals("2")&&i==1) {
			System.out.println("사용자가 이겼습니다.");
			System.out.println("다시 하겠습니다.");
			uWin++;
		
		}else if(rsp.equals("3")&&i==2) {
			System.out.println("사용자가 이겼습니다.");
			System.out.println("다시 하겠습니다.");
			uWin++;
	
		}else if(Integer.parseInt(rsp)==i) {
			System.out.println("비겼습니다.");			
		}		
	}		
}
}
