package com.bs.practice.chap01.ControlPractice;
import java.util.Scanner;

public class ControlPractice {
	
	public void practice1() {
		Scanner sc=new Scanner(System.in);
		int menu=0;
		System.out.println("1. 입력\n"+"2. 수정\n"+"3. 조회\n"+"4. 삭제\n"+"7. 종료");
		menu=sc.nextInt();
		switch(menu) {
		case 1 : System.out.println("입력 메뉴입니다.");break;
		case 2 : System.out.println("수정 메뉴입니다.");break;
		case 3 : System.out.println("조회 메뉴입니다.");break;
		case 4 : System.out.println("삭제 메뉴입니다.");break;
		case 7 : System.out.println("프로그램이 종료됩니다.");break;
		}
	}
	
	public void practice2() {
		Scanner sc=new Scanner(System.in);
		System.out.print("숫자를 한 개 입력하세요 : ");
		int num=sc.nextInt();
		if(num%2==0&&num!=0) {
			System.out.println("짝수다");
		}else if(num<0) {
			System.out.println("양수만 입력해주세요.");
		}else if(num==0) {
			System.out.println("0이다");
		}
		else {
			System.out.println("홀수다");
		}
		
	}
	
	public void practice3() {
		Scanner sc=new Scanner(System.in);
		System.out.print("국어점수 : ");
		int kor=sc.nextInt();
		System.out.print("수학점수 : ");
		int math=sc.nextInt();
		System.out.print("영어점수 : ");
		int eng=sc.nextInt();
		double total=(math+eng+kor)/3;
		
		if(kor>=40&&math>=40&&eng>=40&&total>=60) {
			System.out.println("축하합니다, 합격입니다!");
		}else {
			System.out.println("불합격입니다.");
		}
				
	}
	
	public void practice4() {
		Scanner sc=new Scanner(System.in);
		System.out.print("1~12 사이의 정수 입력 : " );
		int num=sc.nextInt();
		switch(num) {
		case 1 : case 2 : case 12 : System.out.println(num+"월은 겨울입니다.");break;
		case 3 : case 4 : case 5 : System.out.println(num+"월은 봄입니다.");break;
		case 6 : case 7 : case 8 : System.out.println(num+"월은 여름입니다.");break;
		case 9 : case 10 : case 11 : System.out.println(num+"월은 가을입니다.");break;
		default : System.out.println(num+"월은 잘못 입력된 달입니다.");break;
			
		}
		
	}
	
	public void practice5() {
		Scanner sc=new Scanner(System.in);
		String id;
		String pw;
		
		System.out.print("아이디 : ");
		id=sc.next();
		System.out.print("비밀번호 : ");
		pw=sc.next();
		if(!id.equals("myId")&&!pw.equals("myPassword12")) {
			System.out.println("아이디, 비밀번호가 틀렸습니다.");
		}else if(!pw.equals("myPassword12")) {
			System.out.println("비밀번호가 틀렸습니다.");
		}else if(!id.equals("myId")){
			System.out.println("아이디가 틀렸습니다.");
		}else {
			System.out.println("로그인 성공");
		}

	}
	
	public void practice6() {
		Scanner sc=new Scanner(System.in);
		System.out.print("권한을 확인하고자 하는 회원 등급 : ");
	    String admin=sc.next();
	    if(admin.equals("관리자")){
	    	System.out.println("회원관리, 게시글 관리, 게시글 작성, 게시글 조회, 댓글 작성");	
	    }else if(admin.equals("회원")) {
	    	System.out.println("게시글 작성, 게시글 조회, 댓글 작성");
	    }else if(admin.equals("비회원")) {
	    	System.out.println("게시글 조회");
	    }else {
	    	System.out.println("권한이 없습니다.");
	    }
	}
	
	public void practice7() {
		Scanner sc=new Scanner(System.in);
		System.out.print("키(m)를 입력해 주세요 : ");
		double height=sc.nextDouble();
		System.out.print("몸무게(kg)를 입력해 주세요 : ");
		double weight=sc.nextDouble();
		double bmi=weight/(height*height);
		System.out.println("BMI 지수 : "+bmi);
		if(bmi<18.5) {
			System.out.println("저체중");
		}else if(bmi>=18.5&&bmi<23) {
			System.out.println("정상체중");
		}else if(bmi>=23&&bmi<25) {
			System.out.println("과체중");
		}else if(bmi>=25&&bmi<30) {
			System.out.println("비만");
		}else if(bmi>=30) {
			System.out.println("고도 비만");
		}
	}
	
	public void practice8() {
		Scanner sc=new Scanner(System.in);
		System.out.print("피연산자1 입력 : ");
		int num1=sc.nextInt();
		System.out.print("피연산자2 입력 : ");
		int num2=sc.nextInt();
		System.out.print("연산자를 입력(+,-,*,/,%) : ");
		String cal=sc.next();
		switch(cal) {
		case "+" : System.out.println(num1+" + "+num2+" = "+num1+num2);break;
		case "-" : System.out.println(num1+" - "+num2+" = "+(num1-num2));break;	
		case "*" : System.out.println(num1+" * "+num2+" = "+num1*num2);break;
		case "/" : System.out.println(num1+" / "+num2+" = "+(double)num1/num2);break;
		case "%" : System.out.println(num1+" % "+num2+" = "+num1%num2);break;
		default : System.out.println("잘못 입력하셨습니다. 프로그램을 종료합니다.");break;
		
		}
		
	}
	
	public void practice9() {
//		메소드 명 : public void practice9(){}
//		중간고사, 기말고사, 과제점수, 출석회수를 입력하고 Pass 또는 Fail을 출력하세요. 
//		평가 비율은 중간고사 20%, 기말고사 30%, 과제 30%, 출석 20%로 이루어져 있고
//		이 때, 출석 비율은 출석 회수의 총 강의 회수 20회 중에서 출석한 날만 따진 값으로 계산하세요. 
//		70점 이상일 경우 Pass, 70점 미만이거나 전체 강의에 30% 이상 결석 시 Fail을 출력하세요.
//		[출력 예시는 다음 3장 참고]
		Scanner sc=new Scanner(System.in);
		System.out.print("중간 고사 점수 : ");
		int middle=sc.nextInt();
		System.out.print("기말 고사 점수 : ");
		int finalTest=sc.nextInt();
		System.out.print("과제 점수 : ");
		int homeWork=sc.nextInt();
		System.out.print("출석 회수 : ");
		int attend=sc.nextInt();
		double result=middle*0.2+finalTest*0.3+homeWork*0.3+attend;
		if(result>=70&&attend>20*0.7) {
			System.out.println("========= 결과 =========");
			System.out.println("중간 고사 점수(20) : "+middle*0.2);
			System.out.println("기말 고사 점수(30) : "+finalTest*0.3);
			System.out.println("과제 점수    (30) : "+homeWork*0.3);
			System.out.println("출석 점수    (20) : "+attend);
			System.out.println("총점 : "+result);
			System.out.println("Pass");
		}else if(result<70&&attend>20*0.7) {
			System.out.println("========= 결과 =========");
			System.out.println("중간 고사 점수(20) : "+middle*0.2);
			System.out.println("기말 고사 점수(30) : "+finalTest*0.3);
			System.out.println("과제 점수    (30) : "+homeWork*0.3);
			System.out.println("출석 점수    (20) : "+attend);
			System.out.println("총점 : "+result);
			System.out.println("Fail [점수 미달]");
		}else if(attend<20*0.7) {
			System.out.println("========= 결과 =========");
			System.out.println("Fail [출석 회수 부족("+attend+"/20)]");
		}
			
	}
	public void practice10() {
		Scanner sc=new Scanner(System.in);
		System.out.println("실행할 기능을 선택하세요.");
		System.out.println("1. 메뉴 출력");
		System.out.println("2. 짝수/홀수");
		System.out.println("3. 합격/불합격");
		System.out.println("4. 계절");
		System.out.println("5. 로그인");
		System.out.println("6. 권한 확인");
		System.out.println("7. BMI");
		System.out.println("8. 계산기");
		System.out.println("9. P/F");
		System.out.println("10. 종료");
		System.out.print("입력 : ");
		
		int menu=sc.nextInt();
		
		switch(menu) {
		case 1 : practice1();break;
		case 2 : practice2();break;
		case 3 : practice3();break;
		case 4 : practice4();break;
		case 5 : practice5();break;
		case 6 : practice6();break;
		case 7 : practice7();break;
		case 8 : practice8();break;
		case 9 : practice9();break;
		case 10 : System.out.println("프로그램을 종료합니다.");;break;
		
		}
	}
	public void practice11() {
		Scanner sc=new Scanner(System.in);
		System.out.print("비밀번호 입력 (1000~9999) : ");
		String pw=sc.next();
		int count=0;
		int length=0;
		
		for(int i=0;i<4;i++) {			
			for(int j=0;j<4;j++) {
				if(i!=j&&pw.charAt(i)==pw.charAt(j)) {
					count++;
				}else if(pw.length()>4) {
					length++;
				}
			}
		}
		if(count>1&&length>1) {
			System.out.println("중복 값 있음, 자리수 안 맞음");
		}else if(length>1) {
			System.out.println("자리수 안 맞음");
		}else if(count>1){
			System.out.println("중복 값 있음");
		}else {
			System.out.println("성공");
		}
	}

}
	
