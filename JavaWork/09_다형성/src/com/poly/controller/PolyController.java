package com.poly.controller;

import java.util.Scanner;

import com.poly.model.vo.AbstractChildClass;
import com.poly.model.vo.AbstractClassTest;
import com.poly.model.vo.Animal;
import com.poly.model.vo.Cat;
import com.poly.model.vo.Chicken;
import com.poly.model.vo.Cow;
import com.poly.model.vo.Dog;
import com.poly.model.vo.DynamicBindTest;
import com.poly.model.vo.Employee;
import com.poly.model.vo.Person;
import com.poly.model.vo.PolyTest;
import com.poly.model.vo.PolyTest2;
import com.poly.model.vo.PolyTestParent;
import com.poly.model.vo.Student;
import com.poly.model.vo.Teacher;

public class PolyController {

	public void basicTest() {
		// 다형성에 대해 알아보자
		// 상속관계에 있는 클래스의 부모클래스 타입으로 선언된 변수에는
		// 자식 클래스 객체를 저장할 수 있게 하는 기술
		PolyTestParent ptp = new PolyTestParent();
		ptp = new PolyTest();// 상속관계일때 저장가능
		ptp = new PolyTest2();

		Object o;
		o = new PolyTestParent();
		o = new String("이것도 저장되니?");
		o = new Scanner(System.in);

		// 자식클래스로 선언된 변수에는 부모클래스의 객체를 저장할 수 있을까?
		// 불가능하다.
		PolyTest pt;
		// pt=new PolyTestParent();

		// 부모타입에 저장된 자식클래스는 업캐스팅되어 저장되기 때문에
		// 자식클래스가 선언한 내용(메소드, 변수)을 읽을 수 없다.
		ptp = new PolyTest();

		ptp.setParentData("부모멤버에 저장");
		String temp = ptp.getParentData();
		System.out.println(temp);

		// 자식 메소드에 접근하기 -> 불가능
		// ptp.setChildData("부모타입에서 저장시키기");

		PolyTest pt2 = new PolyTest();
		pt2.setChildData("저장하기");
		pt2.setParentData("부모접근하기");

		// 부모타입에 저장된 자식클래스 객체의 멤버메소드에 접근하려면 형변환을 해야한다.
		pt2 = (PolyTest) ptp;

		pt2.setChildData("저장하기");
		System.out.println(pt2.getChildData());
		ptp = pt2;

	}

	public void TestPerson() {
		Person p;
		p = new Student("유병승", 19, 1, "실용음학과");
		System.out.println(
				p.getName() + " " + p.getAge() + " " + ((Student) p).getGrade() + " " + ((Student) p).getMajor());
//		p = new Teacher("유병승", 19, "웹프로그래밍", 100);
//		System.out.println(
//				p.getName() + " " + p.getAge() + " " + ((Teacher) p).getSubject() + " " + ((Teacher) p).getSalary());

		printPerson(p);
		printPerson(new Student("최주영", 26, 2, "컴공"));
		printPerson(new Teacher("유병승", 19, "web", 100));
		printPerson(new Employee());

		PolyTestDao dao = new PolyTestDao(new Teacher());
		PolyTestDao dao2 = new PolyTestDao(new Student());

		Teacher t = new Teacher("유병승", 19, "Web", 100);
		Teacher t2 = new Teacher("유병승", 19, "Web", 100);
		System.out.println(t.equals(t2));
		System.out.println(t.equals(dao));

	}

	public void printPerson(Person p) {
		// instanceof
		if (p instanceof Student) {
			System.out.println(
					p.getName() + " " + p.getAge() + " " + ((Student) p).getGrade() + " " + ((Student) p).getMajor());
		} else if (p instanceof Teacher) {
			System.out.println(p.getName() + " " + p.getAge() + " " + ((Teacher) p).getSubject() + " "
					+ ((Teacher) p).getSalary());
		}

	}

	public Person makePerson(int type) {
		Person p;
		switch (type) {
		case 1:
			p = new Person();
			break;
		case 2:
			p = new Student();
			break;
		case 3:
			p = new Teacher();
			break;
		case 4:
			p = new Employee();
			break;
		default:
			p = null;
			break;
		}
		return p;
	}

	public void objArrPolyTest() {
		// 객체배열의 다형성 적용하기
		Person[] persons = new Person[9];
		persons = new Person[] { new Student("최주영", 26, 2, "컴공"), new Student("이동제", 25, 1, "자동차"),
				new Teacher("유병승", 19, "web", 100), new Teacher("이다영", 25, "java", 80),
				new Employee("김현영", 26, "디자인", "개발자"), new Employee("최솔", 29, "연구팀", "개발자")

		};
		Teacher[] teachers = new Teacher[4];
		Student[] students = new Student[3];
		Employee[] employees = new Employee[2];
		Teacher[] teacherAge = new Teacher[teachers.length];
		int index = 0;
		for (Teacher t : teachers) {
			if (t != null && t.getAge() > 20) {
				teacherAge[index++] = t;
			}
		}
		Student[] studentAge = new Student[students.length];
		index = 0;
		for (Student t : students) {
			if (t != null && t.getAge() >= 20) {
				studentAge[index++] = t;
			}
		}

		index = 0;
		Person[] ageSearch = new Person[persons.length];
		for (Person p : persons) {
			if (p != null && p.getAge() > 25) {
				ageSearch[index++] = p;
			}
		}
		for (Person p : ageSearch) {
			if (p != null) {
				System.out.println(p.getName() + " " + p.getAge());
			}
		}

		// persons에 저장된 student, teacher, employee의 수와 전체 저장 사람수를 구하시오.
		int countS = 0, countT = 0, countE = 0, countP = 0;
		for (int i = 0; i < persons.length; i++) {
			if (persons[i] != null) {
				if (persons[i] instanceof Student) {
					countS++;
				} else if (persons[i] instanceof Teacher) {
					countT++;
				} else if (persons[i] instanceof Employee) {
					countE++;
				}
				countP++;
			}
		}
		System.out.println("학생 : " + countS + " 선생 : " + countT + " 사원 : " + countE + " 총합 : " + countP);
	}

	public void dynamicBind() {
		DynamicBindTest dbt = new DynamicBindTest();
		System.out.println(dbt.toString());
		Object obj = new DynamicBindTest();
		System.out.println(obj.toString());
		Animal a = new Cat();
		a.bark();
		a = new Dog();
		a.bark();
		
		//저장된 동물의 울음소리출력하는 기능
		Animal[] animals=new Animal[10];
		animals[0]=new Dog("뽀삐","강아지",6);
		animals[1]=new Cat("뽀송","고양이",3);
		animals[2]=new Dog("복실이","강아지",7);
		animals[3]=new Cat("뽀짝이","고양이",3);
		animals[4]=new Dog("바둑이","강아지",5);
		animals[5]=new Cow("워낭소리","소",13);
		animals[6]=new Chicken();
		
		
		for(int i=0;i<animals.length;i++) {
			if(animals[i]!=null)animals[i].bark();
		}
		
	}
	
	public void abstractClasstest() {
		//추상클래스 이용하기
		//자료형으로는 이용이 가능하다.
		AbstractClassTest act;
		//act=new AbstractClassTest();
		act=new AbstractChildClass();
		act.getTitle();
		act.getWriter();
	}
}
