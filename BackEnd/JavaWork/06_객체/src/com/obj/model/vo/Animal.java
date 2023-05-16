package com.obj.model.vo;

public class Animal {

	public String type;	
	public String name;
	public double weight;
	public int length;
	public String habitat;
	
	public Animal() {}
	
	public Animal(String type, String name, 
			double weight, int length, String habitat) {
		this.type=type;
		this.name=name;
		this.weight=weight;
		this.length=length;
		this.habitat=habitat;
	}
	
}
