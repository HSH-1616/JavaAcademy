package com.objarr.controller;

public class Fruit {
	
	private String name;
	private double weight;
	private String color;
	private int price;
	
	public Fruit() {}
	
	public Fruit(String name,double weight,String color,int price) {
		this.name=name;
		this.weight=weight;
		this.color=color;
		this.price=price;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	
	public void setWeight(double weight) {
		this.weight=weight;
	}
	public double getWeight() {
		return weight;
	}
	
	public void setColor(String color) {
		this.color=color;
	}
	public String getColor() {
		return color;
	}
	
	public void setPrice(int price) {
		this.price=price;
	}
	public int getPrice() {
		return price;
	}

}
