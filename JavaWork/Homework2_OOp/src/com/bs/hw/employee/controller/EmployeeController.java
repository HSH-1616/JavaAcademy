package com.bs.hw.employee.controller;

import com.bs.hw.employee.model.vo.Employee;

public class EmployeeController {
	Employee e=new Employee();
	
	public void add(int empNo, String name,char gender,String phone)  {
		empNo+=e.getEmpNo();
		name+=e.getName();
		gender+=e.getGender();
		phone+=e.getPhone();
	}
	
	public void add(int empNo,String name,char gender,String phone,String dept,int salary,double bonus) {
		empNo+=e.getEmpNo();
		name+=e.getName();
		gender+=e.getGender();
		phone+=e.getPhone();
		dept+=e.getDept();
		salary+=e.getSalary();
		bonus+=e.getBonus();
	}
	
	public void modify(String phone) {
		phone=e.getPhone();		
	}
	
	public void modify(int salary) {
		salary=e.getSalary();
	}
	
	public void modify(double bonus) {
		bonus=e.getBonus();
	}
	
	public Employee remove() {
		return e=null;
	}
	
	public String inform() {
		String inform="";
		if(e==null) {
			inform="false";
		}else {
			e.printEmployee();
			inform="true";
		}
		return inform;
	}

}
