package com.inherit.model.vo;

public class Employee extends Person {
	//이름, 나이, 성별, 전화번호, 주소
	//부서, 연봉, 연차
	
	private String departement;
	private int salary;
	private int yearMinus;
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(String name, int age, char gender, String phone, String address,String departement, int salary, int yearMinus) {
		super(name,age,gender,phone,address);
		this.departement = departement;
		this.salary = salary;
		this.yearMinus = yearMinus;
	}

	public String getDepartement() {
		return departement;
	}

	public void setDepartement(String departement) {
		this.departement = departement;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getYearMinus() {
		return yearMinus;
	}

	public void setYearMinus(int yearMinus) {
		this.yearMinus = yearMinus;
	}
	
	public String infoEmployee() {
		return getName()+" "+getAge()+" "+getGender()+" "+getPhone()
		+" "+getAddress()+" "+departement+" "+salary+" "+yearMinus;
	}
	
	@Override
	public String info() {
		return infoEmployee();
	}
	
	
}
