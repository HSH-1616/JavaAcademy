package com.obj.model.vo;

public class Employee {
	// 필드선언
	private static int count;
	private int empNo;
	private String name;
	private String department;
	private int salary;
	private double bonus;
	
	{
		empNo=++count;
	}
	
	// 생성자
	public Employee() {}

	// 매개변수 있는 생성자
	public Employee(String name, String department, int salary, double bonus) {
		this.name = name;
		this.department = department;
		this.salary = salary;
		this.bonus = bonus;
	}

	public String infoEmp() {
		return this.empNo + " " + this.name + " " + this.department + " " 
	    + this.salary + " " + this.bonus;
	}

	// 필드를 조작할 수 있는 setter/getter선언하기
	// name필드
	public void setName(String name) {
		if (name.length() >= 2)
			this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public int getEmpNo() {
		return this.empNo;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getSalary() {
		return this.salary;
	}
	
	public void setBonus(double bonus) {
		this.bonus=bonus;
	}
	
	public double getBonus() {
		return this.bonus;
	}

}
