package com.bs.hw.person.controller;

import com.bs.hw.person.model.vo.Employee;
import com.bs.hw.person.model.vo.Student;

public class PersonController {

	public Student[] s = new Student[3];
	private Employee[] e = new Employee[10];

	public int[] personCount() {
		int[] temp = new int[2];
		int sCount = 0;
		int eCount = 0;
		for (int i = 0; i < s.length; i++) {
			if (s[i] != null) {
				sCount++;
				temp[0] = sCount;
			}
		}

		for (int i = 0; i < e.length; i++) {
			if (e[i] != null) {
				eCount++;
				temp[1] = eCount;
			}
		}
		return temp;
	}

	public void insertStudent(String name, int age, double height, double weight, int grade, String major) {

		for (int i = 0; i < s.length; i++) {
			if (s[i] == null) {
				s[i] = new Student(name, age, height, weight, grade, major);
				break;
			}
		}
	}

	public Student[] printStudent() {
		Student[] temp = new Student[3];
		for (int i = 0; i < s.length; i++) {
			if (s[i] != null) {
				temp[i] = s[i];
			}
		}
		return temp;
	}
	
	public void insertEmployee(String name, int age, double height, double weight, int salary, String dept) {
		for(int i=0;i<e.length;i++) {
			if(e[i]==null) {
				e[i]=new Employee(name,age,height,weight,salary,dept);
				break;
			}
		}		
	}
	
	public Employee[] printEmployee() {
		Employee[] temp=new Employee[e.length];
		for(int i=0;i<e.length;i++) {
			if(e[i]!=null) {
				temp[i]=e[i];
			}
		}
		return temp;
	}
}
