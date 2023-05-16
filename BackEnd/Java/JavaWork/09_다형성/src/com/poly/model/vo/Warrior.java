package com.poly.model.vo;

public class Warrior extends Character {
	private int power;

	public Warrior() {
		// TODO Auto-generated constructor stub
	}

	public Warrior(int hp, int level, String name, int power) {
		super(hp, level, name);
		this.power = power;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	@Override
	public String toString() {
		return super.toString() + " Warrior [power=" + power + "]";
	}

	public void warriorAttack() {
		System.out.println(power + "로 공격하기!!");
	}

	public void warriorDefence() {
		System.out.println("전사 막기!!!");
	}

	@Override
	public void attack() {
		warriorAttack();
	}
	@Override
	public void defence() {
		warriorDefence();
	}
}
