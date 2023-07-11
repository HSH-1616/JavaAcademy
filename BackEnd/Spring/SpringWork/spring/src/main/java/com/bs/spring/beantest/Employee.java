package com.bs.spring.beantest;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee {
	private String name;
	private int age;
	private String address;
	private int salary;
	private Department dept;
	
	public Employee(Department dept) {
		this.dept=dept;
	}
	
	public void initialMethod() {
		System.out.println(this.getClass().getName()+"클래스생성했다!");		
	}
	
	public void destoryMethod() {
		System.out.println("객체 으악!");
	}
}
