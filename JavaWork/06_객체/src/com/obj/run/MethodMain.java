package com.obj.run;

import com.obj.basiccontroller.MethodTest;

public class MethodMain {
	
	public static void main(String[] args) {
		//클래스에 선언된 메소드 호출하기
		//클래스의 멤버 메소드를 호출하려면 클래스를 객체로 생성해야한다.
		MethodTest mt=new MethodTest();
		mt.printMsg();	
		//반환형이 있는 메소드 호출하기
		int result=mt.plus();
		System.out.println(result);
		mt.printSendMsg("ㅇㅇ");
		mt.printSendMsg("ㅋㅋ");
		String data="안녕";
		mt.printSendMsg(data);
		
		result=mt.complexNumber(20,30);
		System.out.println(result);
//		mt.numberTest();
//		mt.numberTest();
//		mt.numberTest();
		new MethodTest().numberTest();
		new MethodTest().numberTest();
		new MethodTest().numberTest();
	}
	//com.obj.basiccontroller.MyMethod
	//"월요일 점심 맛있게 먹어요" 출력하는 메소드 작성하기
	
	//숫자를 1~5까지 더한수를 반환하는 메소드 작성하기

	//사용자한테 5번 메세지를 입력받고 입력받은 메세지를 반환하는 메소드 만들기

	//정수 두개, 연산자 한개를 전달받아 계산결과를 출력하는 메소드 만들기
	
	//정수 두개, 연산자 한개를 전달받아 계산결과를 반환하는 메소드 만들기

	//문자열을 전달받아 문자열에 중복값이 있는지 결과를 반환하는 메소드 만들기
}
