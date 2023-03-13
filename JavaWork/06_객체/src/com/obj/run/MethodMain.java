package com.obj.run;

import java.util.Arrays;

import com.obj.basiccontroller.MethodTest;
import com.obj.model.vo.Animal;

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
//	int[] intArr=mt.testRetrun();{//배열을 반환받자!
//		System.out.println(Arrays.toString(intArr));
//		Animal a=mt.makeAnimal();
//		System.out.println(a);
//		System.out.println(a.type+a.name+a.weight);
//	}
	
	//매개변수, 반환형으로 배열이나 객체를 선언했을때는 heap영역의
	//주소를 공유하게됨, -> 원본값을 수정할 수 있게 됨.
//	int su=10;
//	mt.changeInt(su);
//	int[] numbers= {1,2,3,4,};
//	mt.changeIntArr(numbers);
//	syso

	
}
