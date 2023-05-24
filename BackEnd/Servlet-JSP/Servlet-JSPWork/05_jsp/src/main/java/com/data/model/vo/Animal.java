package com.data.model.vo;

import java.io.Serializable;
import java.util.Objects;

public class Animal implements Serializable {

	private static final long serialVersionUID = 207251685964143194L;
	private String name;
	private int age;
	private String gender;
	private double weight;
	
	public Animal() {
		// TODO Auto-generated constructor stub
	}

	public Animal(String name, int age, String gender, double weight) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.weight = weight;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	@Override
	public String toString() {
		return "Animal [name=" + name + ", age=" + age + ", gender=" + gender + ", weight=" + weight + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(age, gender, name, weight);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Animal other = (Animal) obj;
		return age == other.age && Objects.equals(gender, other.gender) && Objects.equals(name, other.name)
				&& Double.doubleToLongBits(weight) == Double.doubleToLongBits(other.weight);
	}
	
}
