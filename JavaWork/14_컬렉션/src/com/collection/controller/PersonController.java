package com.collection.controller;

import java.util.ArrayList;

import com.collection.common.PersonNameDecending;
import com.collection.model.vo.Person;

public class PersonController {

	public static void main(String[] args) {
		ArrayList p = new ArrayList();

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
		for (int i = 0; i < p.size(); i++) {
			Person p1 = (Person) p.get(i);
			if (p1.getHeight() >= 180) {
				p1.setAge(p1.getAge() + 1);
				System.out.println(p.get(i));
			}
		}
		System.out.println("3번");
		for (int i = 0; i < p.size(); i++) {
			Person p1 = (Person) p.get(i);
			if(p1.getAge()>=40) {
				System.out.println(p.get(i));
			}
		}
		System.out.println("4번");
		p.sort(new PersonNameDecending());
		for(Object o : p) {
			System.out.println(o);
		}

	}

}
