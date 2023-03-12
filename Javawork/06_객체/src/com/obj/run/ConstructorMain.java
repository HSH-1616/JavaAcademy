package com.obj.run;

import com.obj.model.vo.Animal;
import com.obj.model.vo.Person;

public class ConstructorMain {

	public static void main(String[] args) {
		//클래스의 생성자 활용하기
		//클래스는 생성해서 이용을 해야한다.
		//클래스를 생성할때 이용하는 것이 생성자다!
		//모든 클래스 선언에는 반드시 생성자선언 코드가 있어야한다.!
		
		Person p=new Person();//기본생성자를 호출한 구문
		System.out.println(p.name+" "+p.age+" "+p.height+" "+p.gender);
		//매개변수 있는 생성자 호출하기
		Person p1=new Person("허성현",25,173.5,'남');
		Person p2=new Person("허성현",24,173.5,'남');
		
		System.out.println(p1.name+p1.age+p1.height+p1.gender);
		System.out.println(p2.name+p2.age+p2.height+p2.gender);
		
		//Animal				
		Animal a1=new Animal("강아지","뽀삐",5,50,"우리집");
		Animal a2=new Animal("고양이","야옹이",3,40,"짬통");
		Animal a3=new Animal("거북이","꼬북이",1.2,5,"어항속");
		
		System.out.println(a1.jong+" "+a1.name+" "+a1.weight+"kg "+a1.height+"cm "+a1.house);
		System.out.println(a2.jong+" "+a2.name+" "+a2.weight+"kg "+a2.height+"cm "+a2.house);
		System.out.println(a3.jong+" "+a3.name+" "+a3.weight+"kg "+a3.height+"cm "+a3.house);
	}

}
