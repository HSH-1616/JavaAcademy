package com.bs.variable;

public class ConvertTest {
	public static void main(String[] args) {
	//형변환에 대해 알아보자
    //특정연산을 실행할때는 피연산자의 타입이 동일해야한다.
	int num=100;
	long lnum=num;
	System.out.println(10+180.5);//원래 int+double은 계산이 안되나 10->10.0 으로 자동형변환 되어 출력 가능하다.
	float fnum=lnum;
	System.out.println(fnum);
	
	//강제형변환
	int num2=(int)173.3;//double을 int로 강제형변환
	System.out.println(num2);
	
	int test=290;
	byte bnum=(byte)test;
	System.out.println(bnum);
	
	//계산에서 강제적 형변환
	//성적, 평균
	int kor=90, eng=54, math=49;
	System.out.println((kor+eng+math)/3);//3개다 int라서 정수로 강제형변환
	System.out.println((kor+eng+math)/3.0);
	System.out.println((double)(kor+eng+math)/3);
	
	//단일문자(char) 형변환
	//char 내부적으로 코드표에 있는 숫자를 저장
	char ch='A'; //A의 아스키코드=65
	int chint=ch;
	System.out.println(chint);
	chint=65;
	System.out.println((char)chint);
	ch++;//(ch+1)
	System.out.println(ch);
	
	for(int i=0;i<10;i++) {
		System.out.println(ch++);
		}
	}	
}
	


