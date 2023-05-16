package com.collection.common;

import java.util.Comparator;

import com.collection.model.vo.Food;
import com.collection.model.vo.Person;

public class PersonNameDecending implements Comparator{
	
	@Override
	public int compare(Object o1, Object o2) {
		Person prev = (Person) o1;
		Person next = (Person) o2;
		if (prev.getName().compareTo(next.getName()) == 0) {
//			if (prev.getPrice() < next.getPrice())
//				return +1;
//			else if (prev.getPrice() > next.getPrice())
//				return -1;
//			else
//				return 0;
//			return prev.getPrice()-next.getPrice();
			return next.getAge()-prev.getAge();
		}
		return prev.getName().compareTo(next.getName());
	}
		

}
