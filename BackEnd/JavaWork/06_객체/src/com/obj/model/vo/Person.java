package com.obj.model.vo;

public class Person {
	
	public String name;
	public int age;
	public char gender;
	public double height;
	public String address;
	
	{
		System.out.println("person초기화블럭");	
	}
	//생성자는 반드시 필요한 코드로 선언하지않으면 jvm이 자동으로 생성해줌
	//생성자는 두가지고 구분
	//1. 기본생성자(default생성자) : 기본값으로 클래스를 생성할때 이용 
	// 접근제한자 클래스명(){}
	public Person() {
		System.out.println("Person 기본생성자 실행");
		name="유병승";
		age=19;
		height=180.5;
		gender='남';
	}
	//2. 매개변수있는 생성자 : 외부에서 생성에 필요한 데이터를 받아서 생성할때 이용
	public Person(String paramName,int paraAge,
			double paramHeight,char paramGender) {
		this.name=paramName;
		this.age=paraAge;
		this.height=paramHeight;
		this.gender=paramGender;
	}
	//생성과 동시에 초기화할 값만 선언해도 된다.
	public Person(String paramName, char paramGender) {
		this.name=paramName;
		this.gender=paramGender;
	}
	public Person(String name, int age) {
		this.name=name;
		this.age=age;
	}
	public Person(char gender,String address) {
		this.address=address;
		this.gender=gender;
	}
	
	//this()생성자를 이용하면 추가로직을 작성하지 않고 활용할 수 있음.
	//생성자 내부에서 다른 생성자를 호출할때 사용
	
	public Person(String name, int age, char gender, String address) {
		this(name,age);
		this.address=address;
		this.gender=gender;
	}
	
	
}
