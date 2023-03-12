package com.obj.model.vo;

public class Animal {
	//매개변수있는 생성자 이용하기
	//동물정보를 저장할 수 있는 클래스 만들기 com.obj.model.vo
	//종류 ,이름, 몸무게, 길이, 서식지
	//개 뽀삐 5kg 50cm 우리집
	//고양이 야옹이 3kg 40cm 짬통
	//거북이 꼬북이 1.2kg 5cm 어항속
	//객체를 생성할때 모든 값이 세팅되어서 생성될 수 있게 하고
	//해당내용 출력하기
	
	public String jong;
	public String name;
	public double weight;
	public int height;
	public String house;
	
	public Animal(String paraJong,String paraName,double paraWeight,int paraHeight,String paraHouse){
		jong=paraJong;
		name=paraName;
		weight=paraWeight;
		height=paraHeight;
		house=paraHouse;
		
	}
	
}
