package com.objarr.controller;

public class Animal {
	private String type;
	private String name;
	private int age;
	private double weight;
	private char gender;
	
	public Animal() {}
	
	public Animal(String type, String name, int age, double weight, char gender) {
		this.type=type;
		this.name=name;
		this.age=age;
		this.weight=weight;
		this.gender=gender;
		
	}
	
	public void setType(String type) {
		this.type=type;
	}
	public String getType() {
		return this.type;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return this.name;
	}
	public void setAge(int age) {
		this.age=age;
	}
	public int getAge() {
		return this.age;
	}
	public void setWeight(double weight) {
		this.weight=weight;
	}
	public double getWeight() {
		return this.weight;
	}
	public void setGender(char gender) {
		this.gender=gender;
	}
	public char getGender() {
		return this.gender;
	}
	
	public String infoAnimal() {
		return this.type+" "+this.name+" "+this.age+" "+this.weight+" "+this.gender;
	}
}
