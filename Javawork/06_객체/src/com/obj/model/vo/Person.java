package com.obj.model.vo;

public class Person {
	public String name;
	public int age;
	public char gender;
	public double height;
	{
		System.out.println("Person 기본생성자 실행");
	}
	
	//생성자는 반드시 필요한 코드로 선언하지 않으면 jvm이 자동으로 생성해준다.
	//생성자는 두가지로 구분 : 
	//1. 기본생성자(default생성자) : 기본값으로 클래스를 생성할때 이용
	//2. 매개변수있는 생성자 : 외부에서 생성에 필요한 데이터를 받아서 생성할때 이용
	//접근제한자 클래스명() {}
	public Person() {
		System.out.println("Person 기본생성자 실행");
		name="허성현";
		age=26;
		height=173.3;
		gender='남';
	}
 	//2. 매개변수있는 생성자 : 외부에서 생성에 필요한 데이터를 받아서 생성할때 이용
	public Person(String paramName,int paramAge,
				double paramHeight,char paramGender) {
		name=paramName;
		age=paramAge;
		height=paramHeight;
		gender=paramGender;
		
		System.out.println(paramName+" "+paramAge+" "+paramHeight+" "+paramGender);
		
	}
	
}
