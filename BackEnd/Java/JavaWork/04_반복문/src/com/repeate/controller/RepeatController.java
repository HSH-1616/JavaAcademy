package com.repeate.controller;
import java.util.Scanner;
import java.util.Random;

public class RepeatController {
	
	public void basicRepeat() {
		//기본 for문 이용하기
		//특정코드를 원하는 만큼 반복 실행하게 하는 명령어
		//for(초기식;조건식;증감식) { 반복할 코드를 작성 }
		//초기식 : 변수선언, 반복한 횟수에 대해 저장하는 공간
		//조건식 : 반복을 더 실행할지 말지 결정하는 조건(true 실행, false 중단)
		//증감식 : 초기식에 선언한 변수의 값을 수정하는 연산 -> 조건식의 결과가 변경
		//반갑습니다! 100번 출력
		for(int i=1;i<=100;i++) {
			System.out.println("반갑습니다!");
		}
		
		//1~10까지 수를 출력하기
		for(int i=1;i<=10;i++) {
			System.out.print(i+" ");
		}
		System.out.println();
		//for문 {} 내부에는 변수선언, 연산자, 조건문 다 사용이 가능
		//{} 내부에서 선언한 것들은 내부에서만 사용이 가능함.
		//5번 실행하는 for문 만들기
		for(int i=1;i<=5;i++) {
			int temp=10+i;
			if(temp%2==0) {
				System.out.println(temp);
		    }
		}
		
		//1부터 100까지의 수를 출력하기
		//1부터 100까지의 수에서 짝수만 출력하기
		for(int i=1;i<=100;i++) {
			System.out.print(i+" ");
			}
		
		System.out.println();
		
		for(int i=2;i<=100;i+=2) {
			//if(i%2==0) {
				System.out.print(i+" ");
			//}
		}
		
		System.out.println();
		
		//100부터 1까지의 수 출력하기
		for(int i=100;i>=1;i--) {
			System.out.print(i+" ");
		}
		
		System.out.println();
		
		int count=100;
		for(int i=1;i<=100;i++) {
			System.out.print(count--+" ");
		}
//		System.out.println();
//		//친구 5명의 이름을 입력받고 출력하기
		Scanner sc=new Scanner(System.in);
//		String friend=" ";
//		
//		for(int i=1;i<=5;i++) {
//			System.out.print("입력 : ");
//			friend+=sc.next()+" ";
//		}
//		System.out.print(friend);
		
		System.out.println();
		//숫자 4개를 입력받아 총합을 구하는 기능 구현하기
//		int num=0;
//		for(int i=1;i<=4;i++) {
//			System.out.print("숫자입력 : ");
//			num+=sc.nextInt();
//		}
//		System.out.println("총합 : "+num);
		
		//for문은 초기식, 조건식, 증감식을 반드시 안써도 된다.
		count=0;
		for(;count<10;count++) {
			System.out.println(count);
		}
//		for(;;count++) { 무한루프
//			System.out.println(count);
//		}
//	    String msg="";
//	    for(;!msg.equals("exit");) {
//	    	System.out.print("메세지 입력 : ");
//	    	msg=sc.next();
//	    	System.out.println(msg);
//	    }
	    //사용자에게 메세지를 입력받고 출력하는 기능
	    //사용자가 "끝"이라는 메세지를 입력할때까지 입력을 받고
	    //입력받은 내용 모두 출력하기 단,끝메세지를 포함하지않기
	    String totalMsg="";
	    String m="";
	    for(;!m.equals("끝");) {
	    	System.out.print("메세지 입력 : ");
	    	m=sc.nextLine(); //변수에 하나의 값 밖에 안들어가서 새로 입력한 값마다 초기화됨
	    	if(!m.equals("끝")) {
	    		totalMsg+=m+" ";//m에 입력한 값마다 totalMsg에 누적이된다.	
	    	}
	    }	    
	    System.out.println(totalMsg);
	    	
	}
	public void forApplication() {
		//for문 응용해보기
		//1부터 사용자가 입력한 수까지 출력하기
		//입력값 : 4 -> 1 2 3 4 -> for(int i=1;i<=4;i++)
		Scanner sc=new Scanner(System.in);
		System.out.print("입력 : ");
		int su=sc.nextInt();
		for(int i=1;i<=su;i++) {
			System.out.print(i+" ");
		}System.out.println();
		
	}
	public void empInputData(){
		//사원정보를 입력받는 기능을 구현하자
		//3명의 사원정보를 입력받고 출력하는 기능
		//입력정보 : 이름, 나이, 성별, 급여, 보너스(소수점)
		//입력한 정보를 한번에 출력
		//버전업 입력전에 입력할 사원수를 입력받고 그 수만큼 입력 후 출력하기
		Scanner sc=new Scanner(System.in);
		String empInfo="";
		System.out.print("입력할 사원수 : ");
		int count=sc.nextInt();
	
		for(int i=0;i<count;i++) {
			System.out.print("==== "+(i+1)+"번"+" 사원 입력정보 ====\n");
			System.out.print("이름 : ");
			sc.nextLine();
			String name=sc.nextLine();
			System.out.print("나이 : ");
			int age=sc.nextInt();
			System.out.print("성별(M/F) : ");
			char gender=sc.next().charAt(0);
			System.out.print("급여 : ");
			int salary=sc.nextInt();
			System.out.print("보너스 : ");
			double bonus=sc.nextDouble();
			empInfo+=name+" "+age+" "+gender+" "+salary+" "+bonus+"\n";
		}
		System.out.println("=== 입력한 사원 정보 ===");
	    System.out.println(empInfo);
		
	}
	public void forApplication2() {
		//숫자에 규칙이 있는 경우에 for문의 초기값을 활용할수 있다.
		String msg="안녕하세요 화요일이에요";
//		System.out.println(msg.charAt(0));
//		System.out.println(msg.charAt(1));
//		System.out.println(msg.charAt(2));
//		System.out.println(msg.charAt(3));
		
		int num=msg.length();
		
		for(int i=0;i<num;i++) {
			System.out.println(msg.charAt(i)); 
		}
		
		//입력받은 문자에 알파벳 대문자가 포함되어있는지 확인하는 기능
		Scanner sc=new Scanner(System.in);
		System.out.print("문자 입력 : ");
		String data=sc.nextLine();
		boolean flag=false;//초기값 false
		int num1=data.length();
		for(int i=0;i<num1;i++) {
			
			if(data.charAt(i)>='A'&&data.charAt(i)<='Z'){
				//System.out.println("대문자");
				flag=true;//대문자 들어가면 true, 하나라도 찾으면 true임
			}
		}
		System.out.println(flag?"대문자 O":"대문자 X");
		
		//입력받은 문자열에 대문자와 소문자의 수를 구하는 기능
		//문자열, 문자를 입력받아 문자열에 문자가 몇개 포함되어있는지 확인하는 기능
	}
	
	public void forInfor() {
		//중첩반복문 for문내부에 for문이 있는 로직
		for(int i=0;i<10;i++) {
			System.out.println(i);
			for(int j=0;j<5;j++){
				System.out.print(j+" ");
			}
			System.out.println();
		}
		//구구단 출력하기
		//2단부터 9단 구구단 출력하기
		for(int i=2;i<10;i++) {
			for(int j=1;j<10;j++) {
				System.out.print(" "+i+" X "+j+"="+(i*j));
			}
			System.out.println();
			
			
		}
		String test="apple";
		//test변수에 저장된 문자열에 중복값이 있는지 확인하는 로직
		for(int i=0;i<test.length();i++) {
			int count=0;
			System.out.println(test.charAt(i));
			for(int j=0;j<test.length();j++) {
				if(i!=j&&test.charAt(i)==test.charAt(j)) {
					count++;
				}
				//System.out.print(test.charAt(j));
			}
			System.out.println(test.charAt(i)+"는 "+count+"개 반복");
		}
		
		//별찍기
		//****
		//****
		//****
		//****
		
		for(int i=0;i<4;i++) {
			for(int j=0;j<4;j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		//*
		//**
		//***
		//****
		//*****
		
		for(int i=0;i<5;i++) {
			for(int j=0;j<i+1;j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
	}
	
	public void whileTest() {
		//while 활용하기
		//반복문을 구현하는 방법 중 하나
		//while(조건문) {반복실행 코드}
		//특정조건에서 반복문을 실행할때 많이 사용
		//의도적인 무한루프를 실행할때 사용
		
		//1부터 10까지 출력하기
		for(int i=1;i<=10;i++) {System.out.println(i);}
		int j=1;
		while(j<=10) {
			System.out.println(j);
			j++;
		}
		
		//사용자가 끝이라고 입력할때까지 입력받는 기능
		Scanner sc=new Scanner(System.in);
		String m="";
		String total="";
//		for(;m.equals("끝");) {}
		while(!m.equals("끝")) {
			System.out.print("메세지 입력 : ");
			m=sc.nextLine();
			if(!m.equals("끝")) total+=m;
			
		}
		System.out.println(total);
		
		//메뉴기능을 구현할때
		int menu=0;
		while(menu!=9) {
			System.out.println("===== BS Lunch =====");
			System.out.println("1. 햄버거");
			System.out.println("2. 치킨");
			System.out.println("3. 피자");
			System.out.println("4. 갈비탕");
			System.out.println("5. 순대국");
			System.out.println("9. 주문종료");
			System.out.print("입력 : ");
			menu=sc.nextInt();
		}
		
		while(true) {
			System.out.println("무한");
		}
		
		//계속 계산할수 있는 계산기 프로그램 만들기
		//public void whileCalculator()
		//두개의 정수, 연산자를 입력받아 계산해주는 기능
		//계산이 끝나면 계속하시겠습니까? 문구 출력 후 
		//Y를 선택하면 한번더 실행, N선택하면 프로그램을 종료합니다 출력 후 종료
	}
	public void whileCalculator() {
		Scanner sc=new Scanner(System.in);
		
		int cal=0;
		char exit;
		//while(exit=='Y') {
		do {
			exit='헐';
			System.out.print("정수 1 : ");
			int su1=sc.nextInt();
			System.out.print("정수 2 : ");
			int su2=sc.nextInt();
			System.out.println("1. 더하기 ");
			System.out.println("2. 빼기 ");
			System.out.println("3. 곱하기 ");
			System.out.println("4. 나누기 ");
			System.out.println("5. 나머지 ");
			System.out.print("입력 : ");
			cal=sc.nextInt();
			System.out.print("결과 : ");
			
			switch(cal) {
				case 1 : System.out.println(su1+su2);break;
				case 2 : System.out.println(su1-su2);break;
				case 3 : System.out.println(su1*su2);break;
				case 4 : System.out.println((double)su1/su2);break;
				case 5 : System.out.println(su1%su2);break;
			}
			while(exit!='N'&&exit!='Y') {
				System.out.print("계속하시겠습니까(Y/N) : ");
				exit=sc.next().charAt(0);
				if(exit!='N'&&exit!='Y') {
					System.out.println("입력값은 Y,N만 가능합니다.!");
				}
			}
		}while(exit=='Y');
		//}
		System.out.println("프로그램을 종료합니다.");
		
	}
	
	public void continueBreakTest() {
		//분기문 활용하기
		//continue : 반복문에서 continue문을 만나면 아래코드를 생략하고 증감식으로 넘어간다.
		//break : 반복문에서 break문을 만나면 끝난다.
		//특정조건에서 반복문의 실행을 통제하기 위해 사용
		Scanner sc=new Scanner(System.in);
		System.out.print("문자 입력 : ");
		String alphabet=sc.nextLine();
		boolean flag=false;	
		for(int i=0;i<alphabet.length();i++) {
			if(alphabet.charAt(i)>='A'&&alphabet.charAt(i)<='Z') {
				flag=true;
				break;//앞에 대문자가 있으면 뒤에꺼는 계산안함
			}
		}
		System.out.println(flag?"대문자 포함":"대문자 미포함");
		
		//중첩반복문에서 이용하기
		t:
		for(int i=2;i<10;i++) {
			for(int j=1;j<10;j++) {
				if(i%2==0) break t;
				System.out.print(" "+i+"X"+j+"="+(i*j));
			}
			System.out.println();
		}
		
		//continue
		for(int i=0;i<10;i++) {
			if(i%2==0) continue;//continue=생략
			System.out.println(i);
		}
		
		for(int i=2;i<10;i++) {
			for(int j=1;j<10;j++) {
				if(j%2==0) continue;
				System.out.print(i+"X"+j+"="+(i*j));
			}
			System.out.println();
		}
		
		
	}
	
	public void randomTest() {
		//자바에서 랜덤값을 출력하기
		//숫자로 출력 -> 임의의 실수(0~1)
		
		//임의의 난수 출력하기
		//1. Math.random() 기능이용
		//2. Random클래스를 이용하는 방법
//		for(int i=0;i<3;i++) {
//			System.out.println((int)(Math.random()*10));
//		}
		//랜덤값을 정수형으로 출력하기
		//Math.random()*10 -> 0 ~ 9
		//Math.random()*20 -> 0 ~ 19
		//1~10 -> Math.random()*10+1
		//1~10까지의 무작위 수 5개 출력하기
//		for(int i=0;i<5;i++) {
//			System.out.println((int)(Math.random()*10)+1);
//		}
		
		//Random클래스 이용하기
		//java.util.Random
		System.out.println("Random 클래스 이용");
		Random r=new Random();
		System.out.println(r.nextInt());
		System.out.println(r.nextInt(10));//0~10
		System.out.println(r.nextInt(20));//0~19
		System.out.println(r.nextInt(20)+1);//1~20
	}



}
