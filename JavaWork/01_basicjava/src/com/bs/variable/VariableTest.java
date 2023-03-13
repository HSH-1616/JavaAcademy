package com.bs.variable;

public class VariableTest {
	public static void main(String[] args) {
		//변수에 값 대입하기
		int age;
		age=26;
		//변수의 값을 출력하기
		System.out.println(age);//age변수의 저장된 값을 출력
		//변수의 값을 저장할때는 변수의 자료형과 리터럴의 자료형이 같아야 한다.
		//age=3.14; = 타입 에러
		
		//문자, 문자열 저장하기
		char alpha;
		alpha='A';
		System.out.println(alpha);
		String address;
		address="서울";
		System.out.println(address);
		
		//실수저장하기
		float height;
		height=190.5f;
		System.out.println(height);
		double weight;
		weight=66.4;
		System.out.println(weight);
		
		//변수는 한개값만 저장이 가능하다.
		age=14;
		System.out.println(age);
		
		//변수에 값을 대입하기 위해서는 반드시 먼저 선언이 되어있어야 한다.
//		name="허성현";
//		String name;
		
		long account;
		account=300000000000L;
		System.out.println(account);
		
		
		//변수를 선언과 동시에 값을 대입할 수 있다.
		String email="abcdef@naver.com";
		System.out.println(email);
		
		int a=100, b=200, c=300;
//		a=100;
//		b=200;
//		c=300;
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		
		byte bnum;
		bnum=100;//자바에서 byte, short는 리터럴에 타입표시를 하지 않아도 자동으로 리터럴을 자료형 변환하여 대입해준다.
		System.out.println(bnum);
		short snum=500;
		System.out.println(snum);
		
		//상수 : 선언된 저장공간에 한번만 값을 대입할 수 있는 것
		//대입 후 수정 불가능
		//에러코드, 지정된 레벨저장할때 사용
		final int AGE;
		//final String ADMIN_NAME;
		AGE=26;
		System.out.println(AGE);
	    //AGE=17; = final 변수는 수정 불가능
		
		
	}
}
