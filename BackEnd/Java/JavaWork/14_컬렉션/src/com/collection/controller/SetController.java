package com.collection.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.collection.model.vo.Student;

public class SetController {

	public static void main(String[] args) {
		// Set에 대해 알아보자 -> 인터페이스
		// 다수의 객체를 보관할 수 있는 클래스
		// HashSet, LinkedHashSet, TreeSet
		// 데이터를 중복해서 저장하지 않음, 데이터를 지정할수 있는 구분자가 없음.
		HashSet set = new HashSet();
		// 데이터 저장하기
		set.add("유병승");
		set.add("최주영");
		set.add("최솔");
		set.add("이다영");
		System.out.println(set);

		// set저장된 데이터를 한개씩 출력하기
		// Iterator인터페이스를 이용해서 출력
		Iterator it = set.iterator();
		while (it.hasNext()) {
			String value = (String) it.next();
			System.out.println(value);
		}
		// forEach문 이용하기
		System.out.println("foreach문으로 출력하기");
		for (Object o : set) {
			System.out.println(o);
		}

		// forEach()메소드 제공됨.
		System.out.println("foreach 메소드 제공");
		set.forEach((o) -> System.out.println(o));
		// set메소드 이용하기
		// 1. set에 저장된 데이터 갯수 확인
		// size()메소드
		System.out.println(set.size());
		// 2. set에 데이터가 저장되어있는지 확인하는 메소드
		// isEmpty()
		System.out.println(set.isEmpty());

		// 3. set에 특정값이 있는지 확인하는 메소드
		// contains(Object) equals, hashCode 오버라이딩 되어있어야 한다.
		System.out.println(set.contains("최솔"));
		System.out.println(set.contains("김중근"));

		// 4. set에 저장되어있는 객체를 삭제하는 메소드
		// remove(Object)
		set.remove("유병승");
		set.forEach((e) -> System.out.println(e));

		// set은 중복되는 데이터는 저장하지 않는다.
		set.add("최주영");
		set.add("최주영");
		set.add("최주영");
		set.add("최주영");
		set.add("최주영");

		set.forEach((e) -> System.out.println(e));

		HashSet lotto = new HashSet();
		while (lotto.size() < 7) {
			lotto.add((int) (Math.random() * 45) + 1);
		}

		System.out.println(lotto);

		HashSet students = new HashSet();

		students.add(new Student("유병승", 1, 3, '남'));
		students.add(new Student("최주영", 3, 2, '남'));
		students.add(new Student("김예린", 2, 1, '여'));
		students.add(new Student("윤나라", 2, 2, '여'));

		students.forEach((s) -> System.out.println(s));

		for (Object o : students) {
			Student s = (Student) o;
			if (s.getGender() == '여')
				System.out.println(s.getName() + " " + s.getGender());
		}

		students.add(new Student("유병승", 1, 3, '남'));
		students.add(new Student("유병승", 1, 3, '남'));
		students.add(new Student("유병승", 1, 3, '남'));

		students.forEach((e) -> {
			System.out.println(e);
		});

		// set과 list의 호환하기
		List studentList = new ArrayList(students);
		System.out.println("리스트로 변환 후 출력하기");
		System.out.println(studentList.get(0));
		System.out.println(studentList.get(1));

		List testData = List.of(1, 2, 3, 4, 5, 5, 6, 6, 7, 7, 8, 8, 10, 10);
		for (Object o : testData) {
			System.out.println(o);
		}
		Set temp = new HashSet(testData);
		testData = new ArrayList(temp);
		for (Object o : testData) {
			System.out.println(o);
		}
		testData.addAll(students);
		System.out.println("students데이터 추가 후 출력하기");
		testData.forEach((e)->System.out.println(e));				
		
		//저장된 순서를 유지하는 set
		LinkedHashSet liSet=new LinkedHashSet();
		liSet.add(1);
		liSet.add(3);
		liSet.add(2);
		liSet.add(2);
		liSet.add(2);
		liSet.add(8);
		liSet.add(4);
		System.out.println("linkedHashSet 출력");
		for(Object i : liSet) {
			System.out.println(i);
		}
		
		//Tree구조에 객체를 대입할때는 그 클래스에 compareTo()메소드가 재정의 되어있어야 한다.
		//Comparable 인터페이스 구현하자!
		//tree 구조에서는 중복값을 기준으로 선언하면 안된다.
		TreeSet studentTree= new TreeSet();
		studentTree.add(new Student("유병승",1,1,'남'));
		studentTree.add(new Student("최주영",2,1,'남'));
		studentTree.add(new Student("김현영",2,2,'여'));
		studentTree.add(new Student("최하리",1,2,'여'));
		
		System.out.println("studentTree출력하기");
		
		for(Object o:studentTree) {
			System.out.println(o);
		}
		
		
	}

}
