package com.collection.controller;

import java.util.ArrayList;
import java.util.Scanner;

import com.collection.model.vo.Person;

public class PracticeController {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ArrayList persons = new ArrayList();

		for (int i = 0; i < 5; i++) {
			System.out.println("이름 : ");
			String name = sc.next();
			System.out.println("나이 : ");
			int age = sc.nextInt();
			System.out.println("성별 : ");
			char gender = sc.next().charAt(0);
			System.out.println("키 : ");
			double height = sc.nextDouble();
			System.out.println("몸무게 : ");
			double weight = sc.nextDouble();

			persons.add(new Person(name, age, gender, height, weight));
		}

		for (Object o : persons) {
			Person p = (Person) o;
			if(p.getHeight()>=180) {
				p.setAge(p.getAge()+1);
				System.out.println(p);
			}
		}
		
		for(Object o : persons) {
			Person p=(Person)o;
			if(p.getAge()>=40) {
				System.out.println(p);
			}
		}
	}

}
