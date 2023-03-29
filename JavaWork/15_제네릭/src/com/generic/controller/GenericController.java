package com.generic.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.model.vo.Animal;
import com.model.vo.Food;
import com.model.vo.Fruit;
import com.model.vo.GenericBasic;
import com.model.vo.GenericInterface;

public class GenericController {
	
	public static void main(String[] args) {
		//제네릭에 대해 알아보자.
		//자바에서 동적타입을 선언하는 구문
		//<자료형>으로 제네릭으로 선언된 자료형을 결정
		
		//제네릭으로 선언된 클래스 이용하기
		GenericBasic<String,Date> gb=new GenericBasic();
		gb.setData("유병승");
		System.out.println(gb.getData());
		//gb.setData(19);
		GenericBasic<Integer,Math> gb1=new GenericBasic();
		gb1.setData(19);
		System.out.println(gb1.getData());
		
		GenericInterface<String, String> stringFilter=(e,v)->e.equals(v);
		stringFilter.check("dfd", "asd");
		
		GenericInterface<GenericBasic<String[],Date>, String> filter=(e,v)->e.equals(v);
		filter.check(new GenericBasic(), "asd");
		
		//ArrayList에서 제네릭타입선언 후 이용하기
		ArrayList<String> names=new ArrayList();
//		names.add(10);
//		names.add(true);
		names.add("유병승");
		names.add("강민기");
		
		for(String s : names) {
			System.out.println(s);
		}
		
		ArrayList<Fruit> fruits=new ArrayList();
		fruits.add(new Fruit("딸기","논산",10,10000));
		fruits.add(new Fruit("포도","송산",10,20000));
		fruits.add(new Fruit("사과","예산",20,35000));
		
		for(int i=0;i<fruits.size();i++) {
			//((Fruit)fruits.get(i)).getName();
			fruits.get(i).getName();
			
		}
		
		Set<Animal> animals=new HashSet();
		animals.add(new Animal("바둑이",8.3,4,"강아지"));
		animals.add(new Animal("꽥꽥이",4.6,3,"오리"));
		
		Iterator<Animal> it=animals.iterator();
		
		while(it.hasNext()) {
			Animal a=it.next();
			System.out.println(a.getName()+" "+a.getWeight());
		}
		
		Map<String,Food> foods=new HashMap();
		foods.put("1", new Food("윤셰프",7000,"급식",new Date()));
		foods.put("2", new Food("족발",35000,"한식",new Date()));
		foods.put("3", new Food("초밥",12000,"일식",new Date()));
		//foods.put("10", new Animal());
		
		Set<String> keys=foods.keySet();
		Iterator<String> it2=keys.iterator();
		
		while(it2.hasNext()) {
			String key=it2.next();
			System.out.println(foods.get(key).getName());													
		}
		
		Set<Map.Entry<String,Food>> entry=foods.entrySet();
		Iterator<Map.Entry<String, Food>> entryIt=entry.iterator();
		while(entryIt.hasNext()) {
			Map.Entry<String, Food> t=entryIt.next();
			System.out.println(t.getKey());
			System.out.println(t.getValue().getName()+" "+t.getValue().getPrice());
		}
		
		//테이블당 음식주문을 관리하는 저장소
		Map<String,List<Food>> foodTable=new HashMap();
		foodTable.put("a",new ArrayList<Food>());
		//짜장면, 짬뽕, 탕수육 -> a
		
		foodTable.get("a").add(new Food("짜장면",8500,"중식",new Date()));
		foodTable.get("a").add(new Food("짬뽕",9000,"중식",new Date()));
		foodTable.get("a").add(new Food("탕수육",15000,"중식",new Date()));
		
		
		List<Food> orderList=foodTable.get("a");
		
		orderList.forEach(food->System.out.println(food));
			
		
		
		
		
		
		
	}
	

}
