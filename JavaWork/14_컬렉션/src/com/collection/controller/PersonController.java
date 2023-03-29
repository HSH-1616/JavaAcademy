package com.collection.controller;

import java.nio.file.spi.FileSystemProvider;
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
		p.sort((o,o2)->{
			int result=1;
			if(((Person)o).getWeight()>=((Person)o2).getWeight()) {
				result=-1;
			}
			return result;
		});
		
		p.forEach(o->System.out.println(o));
		
		System.out.println("6번");
		p.add(2,new Person("최주영",26,'남',177.3,70.5));
		p.forEach(o->System.out.println(o));
		
		System.out.println("7번");
		p.set(3,new Person("이동제",25,'남',175.3,68.3));
		p.forEach(o->System.out.println(o));
		
		System.out.println("8번");
		boolean result=p.contains(new Person("고길동",20,'남',175.5,70.5));
		if(result==false) {
			p.add(new Person("고길동",20,'남',175.5,70.5));
		}
		p.forEach(o->System.out.println(o));
		
		System.out.println("9번");
		int count=0;
		for(int i=0;i<p.size();i++) {
		count=p.indexOf(((Person)p.get(i)).getName().equals("선덕여왕"));							
		}		
		System.out.println(count);
		
		System.out.println("10번");
		p.remove(4);
		p.forEach(o->System.out.println(o));
		
		System.out.println("11번");
		p.remove(new Person("김두환",42,'남',188.2,95.5));
		p.forEach(o->System.out.println(o));
		
		System.out.println("12번");		
		System.out.println(p.isEmpty()?"사람없어요~~":"사람있어요~");
		
		System.out.println("13번");
		p.removeAll(p);
		p.forEach(o->System.out.println(o));
	}

}
