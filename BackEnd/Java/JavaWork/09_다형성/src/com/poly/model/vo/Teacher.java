package com.poly.model.vo;

public class Teacher extends Person {

	private String subject;
	private int salary;

	public Teacher() {

	}

	public Teacher(String name, int age, String subject, int salary) {
		super(name, age);
		this.subject = subject;
		this.salary = salary;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof Teacher) {
			Teacher t = (Teacher) o;
			if (getName().equals(t.getName()) && getAge() == t.getAge() && getSubject().equals(t.getSubject())
					&& getSalary() == t.getSalary()) {
				return true;
			}

		}
		return false;
	}
}
