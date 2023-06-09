package com.obj.model.vo;

public class StaticTest {
	//static예약어를 사용한 필드는 클래스를 생성(객체화) 하지 않고 사용할수 있는 저장공간
	public static String test;
	private static int count;
	private String member;
	private static final String ERROR_404;
	static {
		ERROR_404="페이지가 없음";
	}
	
	//메소드에 static 사용하기
	public static void testMethod() {
		System.out.println("static메소드");
	}
	public static void setCount(int count) {
		StaticTest.count=count;
		//필드 (멤버변수)는 static 메소드에서 이용하지 못함.
		//member="김찬은";
		//memberMethod();
	}	
	public static int getCount() {
		return StaticTest.count;
	}
	public void memberMethod() {
		System.out.println("멤버 메소드!");
	}
}
