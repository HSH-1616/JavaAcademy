package com.api.controller;

public class WrapperController {
	public static void main(String[] args) {
		//Wrapper클래스 이용하기
		//기본자료형을 객체로 사용할수 있게 해주는 클래스
		//자동처리됨(autoBoxing, autoUnBoxinh)
		//int -> Integer 맵핑
		//double -> Double 맵핑
		//long -> Long 맵핑
		//booelan -> Boolean
		//char -> Character
		Object obj=10;
		
		Integer age=19;
		int intAge=age;
		System.out.println(age);
		System.out.println(intAge);
		test(19);
		test(180.5);
		test(true);
		test('a');
		int test=getInt();
		System.out.println(test);
		
		//문자열을 기본타입으로 변경하는 메소드를 제공
		//Wrapper 클래스
		//자료형.parse 자료형("문자열")
		String test2="20";
		int change=Integer.parseInt(test2);
		System.out.println(change);
		test2="180.5";
		double height=Double.parseDouble(test2);
		System.out.println(height);
		test2="유병승";
		char a=test2.charAt(0);
		int result=Integer.max(100,200);
		System.out.println(result);
		result=Integer.min(100,200);
		System.out.println(result);
		
	}
	public static void test(Object o) {
		System.out.println(o);
	}
	
	public static Integer getInt() {
		return 10;
	}

}
