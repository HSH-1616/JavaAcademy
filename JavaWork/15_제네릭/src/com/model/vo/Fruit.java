package com.model.vo;

import java.util.Objects;

public class Fruit {

	private String name;
	private String make;
	private int su;
	private int price;

	public Fruit() {
		// TODO Auto-generated constructor stub
	}

	public Fruit(String name, String make, int su, int price) {
		super();
		this.name = name;
		this.make = make;
		this.su = su;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Fruit [name=" + name + ", make=" + make + ", su=" + su + ", price=" + price + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(make, name, price, su);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Fruit other = (Fruit) obj;
		return Objects.equals(make, other.make) && Objects.equals(name, other.name) && price == other.price
				&& su == other.su;
	}

}
