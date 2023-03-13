package com.obj.basiccontroller;

import com.obj.model.vo.Animal;

public class MethodTest {
	
	private int count;
	
	
	
	public MethodTest() {}
	
	//메소드는 클래스가 제공하는 기능 의미
	
	//1. 반환형이 없고 매개변수도 없는 메소드 선언하기
	//반환형이 없음 : void
	//매개변수 없음 : ()
	//접근제한자(public) [예약어] 반환형 메소드명([매개변수선언]){기능구현}
	public void printMsg() {
		System.out.println("printMsg실행함!");
	}
	//2. 반환형있고 매개변수없는 메소드 구현하기
	//반환형에는 반환할 값의 타입을 선언을 한다.
	//특정값을 더하고 결과를 반환하는 기능
	public int plus() {
		int su=100;
		int su2=200;
		//반환형을 처리하는 예약어를 사용 -> return 값||변수
		return su+su2;
	}
	
	//3. 반환형이 없고 매개변수가 있는 메소드
	// 호출하는 곳에서 전달한 문자열를 출력해주는 기능
	public void printSendMsg(String msg) {
		System.out.println("전달한 메세지 : "+msg);
	}
	//4. 반환형있고 매개변수 있는 메소드
	// 정수 두개를 전달받아 두값을 곱한 결과를 반환하는 기능만들기
	public int complexNumber(int su, int su2) {
		//return su*su2;
		int result=su*su2;
		return result;
	}
	
	//메소드 구현부 -> 메소드의 {}내부
	//변수선언(지역변수), 조건문, 반복문, 필드(멤버변수)등 모두 사용가능
	
	//1부터 10까지 출력해주는 메소드 만들기
	public void numberTest() {
		this.count+=1;
		int count=0;
		count+=1;
		for(int i=1;i<=10;i++) {
			if(i%2==0)
				System.out.print(i+" ");
		}
		System.out.println();
		System.out.println("필드출력 : "+this.count);
		System.out.println("지역변수 : "+count);
	}
	//com.obj.basiccconroller.MyMethod
	//"월요일 점심 맛있게 먹어요" 출력하는 메소드 작성하기
	
	//숫자를 1~5까지 더한수를 반환하는 메소드 작성하기
	
	//사용자한테 5번 메세지를 입력받고 입력받은 메세지를 반환하는 메소드 만들기
	
	//정수 두개, 연산자 한개를 전달받아 계산결과를 출력하는 메소드 만들기
	
	//정수 두개, 연산자 한개를 전달받아 계산결과를 반환하는 메소드 만들기
	
	//문자열을 전달받아 문자열에 중복값이 있는지 결과를 반환하는 메소드 만들기
	
	//java의 메소드 반환값은 한개만 가능하다.
//	public int testReturn() {
//		return 10,20,30,40;
//	}
	
	//다수값을 반환하거나 전달(매개변수)받으려면
	//1. 배열
	//2. 클래스 
	//를 선언한다.
	public int[] testReturn() {
//		return new int[]{10,20,30,40};
		int[] returnvalue= {10,20,30,40};
		return returnvalue;
	}
	
	public Animal makeAnimal() {
		return new Animal();
	}
	
	public void paramArr(int[] intArr) {
		for(int i : intArr){
			System.out.println(i);
		}
	}
	public void paramObj(Animal animal, String type) {
		animal.type=type;
	}
	
	public int changeInt(int num) {
		//num+=20;
		return num+20;
	}
	public void changeIntArr(int[] intArr) {
		intArr[0]=200;
	}
	
	
	
}





