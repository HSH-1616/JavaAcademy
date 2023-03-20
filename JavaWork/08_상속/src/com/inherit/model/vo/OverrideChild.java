package com.inherit.model.vo;

public class OverrideChild extends OverrideParent{
	//override는 메소드 선언부를 부모에 선언된 메소드와 동일하게 선언해야한다.
//	public void printMsg(String msg) {
//		System.out.println("Override Child");		
//	}
	//메소드 오버라이드를 할때는 어노테이션으로 표시해서 관리를 해준다.
	//어노테이션 : @어노테이션명
	@Override//Override가 맞는지 확인->선언된 메소드가 부모클래스에 있는지 
	public void printMsg() {
		System.out.println("어노테이션으로 오버라이드");
	}
//	@Override
//	public void pritnMsg() {
//		System.out.println("자식 클래스에서 재정의");
//	}
//	
}
