package com.poly.model.vo;

public class Employee extends Person {
	private String department;
	private String job;
	
	public Employee() {
		
	}

	public Employee(String department, String job) {
		super();
		this.department = department;
		this.job = job;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Employee(String name, int age, String department, String job) {
		super(name, age);
		this.department = department;
		this.job = job;
	}

}
