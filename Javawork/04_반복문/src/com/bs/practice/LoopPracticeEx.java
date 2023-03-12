package com.bs.practice;

import java.util.Scanner;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class LoopPracticeEx {
	Scanner sc = new Scanner(System.in);

	public void practice1() {

		for (int i = 1; i <= 100; i++) {
			System.out.print(i + " ");
		}
	}

	public void practice2() {

		for (int i = 100; i >= 0; i--) {
			System.out.print(i + " ");
		}
	}

	public void practice3() {

		for (int i = 1; i <= 100; i++) {
			if (i % 2 == 0) {
				System.out.print(i + " ");
			}
		}

		System.out.println();

		for (int i = 2; i <= 100; i += 2) {
			System.out.print(i + " ");
		}
	}

	public void practice4() {
		int total = 0;

		for (int i = 1; i <= 100; i++) {
			total += i;
		}
		System.out.println("합계 : " + total);
	}

	public void practice5() {
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();

		for (int i = 2; i <= num; i += 2) {
			System.out.print(i + " ");
		}
	}

	public void practice6() {
		int total = 0;

		System.out.print("정수 입력 : ");
		int num = sc.nextInt();

		for (int i = 2; i <= num; i += 2) {
			total += i;
		}
		System.out.println("입력 받은 정수까지의 짝수의 합 : " + total);
	}

	public void practice7() {
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();

		for (int i = 1; i <= num; i++) {
			if (i % 2 == 0) {
				System.out.print("박");
			} else {
				System.out.print("수");
			}
		}
	}

	public void practice8() {
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();

		if (num >= 1 && num <= 9) {
			for (int i = num; i <= num; i++) {
				for (int j = 1; j < 10; j++) {
					System.out.println(i + " X " + j + " = " + i * j);
				}
			}
		}else {
			System.out.println("잘못 입력하셨습니다.");
		}

	}
	
	public void practice9() {
		System.out.print("문자열 입력 : ");
		String str=sc.nextLine();
		System.out.println("문자 입력 : ");
		char ch=sc.next().charAt(0);
	
		for(int i=0;i<str.length();i++) {
			int count=0;
			for(int j=0;j<str.length();j++) {
				if(i!=j&&str.charAt(i)==str.charAt(j)) {
					count++;
				}			
			}
			System.out.println(str.charAt(i)+"는"+count);
		}
	}
	
	public void practice10() {
		String msg="";
		
		for(int i=0;i<5;i++) {
		System.out.print("이름 : ");
		String name=sc.next();
		System.out.print("나이 : ");
		int age=sc.nextInt();
		System.out.print("주소 : ");
		sc.nextLine();
		String adress=sc.nextLine();
		System.out.print("키 : ");
		int height=sc.nextInt();
		System.out.print("몸무게 : ");
		int weight=sc.nextInt();
		System.out.print("연락처 : ");
		int phone=sc.nextInt();
		msg+=name+" "+ age+" "+adress+" "+height+" "+weight+" "+phone+"\n";
		}
			System.out.print("===== 저장회원 =====\n"+msg);
	}
	
	public void practice11() {
		
		int num=0;
		int exp=0;
		int mob=0;
		
		System.out.print("사용법\n"+"0.사냥시작 1.오크사냥 2.용사냥 3.사람사냥 99.끝내기\n입력 : ");			
		num=sc.nextInt();	
		while(num!=99) {
			System.out.print("사용법\n"+"0.사냥시작 1.오크사냥 2.용사냥 3.사람사냥 99.끝내기\n입력 : ");			
			num=sc.nextInt();			
			if(num==0) {
				System.out.println("사냥을 시작합니다.");
				System.out.print("사용법\n"+"0.사냥시작 1.오크사냥 2.용사냥 3.사람사냥 99.끝내기\n입력 : ");			
				num=sc.nextInt();
			}else if(num==1) {
				System.out.println("오크 사냥 완료");
				exp+=5; mob+=1;
			}else if(num==2) {
				System.out.println("용 사냥 완료");
				exp+=15; mob+=1;
			}else if(num==3) {
				System.out.println("사람 사냥 완료");
				exp+=1; mob+=1;
			}else if(num==99) {
				System.out.println("사냥을 마쳤습니다.\n사냥한 몹의수는"+mob+"마리 "
						+"획득한 경험치는 "+exp+"exp 입니다.");
			}else {
				System.out.println("잘못 누르셨습니다.");
			}
			
		}
		
	}
	//public void 

}
