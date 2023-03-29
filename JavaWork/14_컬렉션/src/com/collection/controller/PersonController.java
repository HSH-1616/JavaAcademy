package com.collection.controller;

import java.util.ArrayList;
import java.util.Scanner;

import com.collection.common.PersonNameDecending;
import com.collection.model.vo.Person;

public class PersonController {

	public static void main(String[] args) {
		ArrayList p = new ArrayList();
		Scanner sc = new Scanner(System.in);
		
//		for (int i = 0; i < 5; i++) {
//			System.out.println("이름 : ");
//			String name = sc.next();
//			System.out.println("나이 : ");
//			int age = sc.nextInt();
//			System.out.println("성별 : ");
//			char gender = sc.next().charAt(0);
//			System.out.println("키 : ");
//			double height = sc.nextDouble();
//			System.out.println("몸무게 : ");
//			double weight = sc.nextDouble();
//
//			p.add(new Person(name, age, gender, height, weight));
//		}

		p.add(new Person("유병승", 19, '남', 180.5, 65.6));
		p.add(new Person("홍길동", 44, '여', 155.5, 45.4));
		p.add(new Person("고길동", 20, '남', 175.5, 70.5));
		p.add(new Person("선덕여왕", 35, '여', 150.2, 50.5));
		p.add(new Person("김두환", 42, '남', 188.2, 95.5));

		System.out.println("1번");
		for (int i = 0; i < p.size(); i++) {
			System.out.println(p.get(i));
		}
		
		System.out.println("2번");
		for (Object o : p) {
			Person ps = (Person) o;
			
			if(ps.getHeight()>=180) {
				ps.setAge(ps.getAge()+1);
				System.out.println(ps);
			}
			ps.setAge(ps.getAge()-1);
		}
		
		System.out.println("3번");
		for(Object o : p) {
			Person ps=(Person)o;
			if(ps.getAge()>=40) {
				System.out.println(ps);
			}
		}
		
		System.out.println("4번");
		p.sort((o,o2)->((Person)o).getName().compareTo(((Person)o2).getName()));		
		p.forEach(o->System.out.println(o));
		
		System.out.println("5번");
		p.sort((o,o2)->((Person)o).getHeight().compareTo(((Person)o2).getHeight()));
		
	
		

	}

}
