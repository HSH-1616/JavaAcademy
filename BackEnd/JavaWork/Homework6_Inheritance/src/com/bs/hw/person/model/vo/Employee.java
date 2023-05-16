package com.bs.hw.person.model.vo;

public class Employee extends Person {

	private int salary;
	private String dept;

	Employee() {

	}

	public Employee(String name, int age, double height, double weight, int salary, String dept) {
		super(name, age, height, weight);
		this.salary = salary;
		this.dept = dept;
	}
	
	public void setSalary(int salary) {
		this.salary=salary;
	}
	
	public int getSalary() {
		return salary;
	}
	
	public void setDept(String dept) {
		this.dept=dept;
	}
	
	public String getDept() {
		return dept;
	}

	@Override
	public String toString() {
		return "사원 이름 : "+getName()+" 사원 나이 : "+getAge()+" 사원 키 : "+getHeight()
		+" 사원 몸무게 : "+getWeight()+" 사원 급여 : "+salary+" 사원 부서 : "+dept;
	}
	
	
	

}
