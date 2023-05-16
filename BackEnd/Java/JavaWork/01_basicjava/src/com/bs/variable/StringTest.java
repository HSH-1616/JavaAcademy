package com.bs.variable;

public class StringTest {
	public static void main(String[] args) {
		//문자열, 자료형 이용하기
		String name="허성현";
		//String은 클래스이다 -> 원래는 new연산자를 이용해 생성해서 써야함.
		//java에서 기본자료형처럼 사용할수있게 해준다.
		name=new String("김철수");
		System.out.println(name);
		
		//문자열 타입의 값에 + 연산하면 피연산자 값을 결합해줌
		String msg="허성현 "+"java 수강생";
		System.out.println(msg);
		//다른 타입과 문자열 타입에 + 연산을 하면 어떻게 될까 -> 결합연산
		msg=26+"살 허성현";
		System.out.println(msg);
		
		int age=26;
		name="허성현";
		msg=name+age;//"허성현"+26
		System.out.println(msg);
		
		msg=20+age+name;
		System.out.println(msg);
		
		msg=20+(age+name);
		System.out.println(msg);
		
		msg="20"+age+name;
		System.out.println(msg);
		
		//본인의 이름, 나이, 성별(M/F) 키, 주소, 전화번호를 변수에 저장하고
		//* 데이터에 맞는 자료형으로 선택
		//나의 이름은 OOO이고 나이는 OO살이고 키는 OOO.OO, 전화번호는 OOO-OOOO-OOOO, 주소는 OOOO 성별은 O이다. 출력
		
		String myName = "허성현";
		int myAge = 26;
		double myHeight = 173.3;
		String myPhoneNumber = "010-6255-7656";
		String myAdress = "서울시 마포구";
		char gender = 'M';
		String print="나의 이름은 " + myName + "이고 나이는 " + myAge + "살이고 키는" + myHeight + ", 전화번호는 " + myPhoneNumber +  ", 주소는 " + myAdress + " 성별은 " + gender +"이다.";
		
		System.out.println(print);
		
		//String은 클래스로 유용한 기능을 가지고 있다.
		//1. String 변수에 저장된 문자열의 길이를 알려주는 기능 (메소드)
		//  - length();
		// "문자열" .length();
		// 문자열변수명.length();
		System.out.println("허성현".length());
		System.out.println(print.length());
		
		int count=print.length();
		System.out.println(count);
		
		//문자열의 변수에 저장된 문자열의 특정문자만 가져오는 기능
		//charAt(번호)
		//"허성현".charAt(0) -> 허
		//myName.charAt(1) -> 성
		System.out.println("허성현".charAt(0));
		System.out.println(myName.charAt(1));
		
		char ch="허성현".charAt(2);
		System.out.println(ch);
		//*주의* 없는 번호를 대입하면 에러가 발생함.
		//char ch="허성현".charAt(4);
		
	}

}
