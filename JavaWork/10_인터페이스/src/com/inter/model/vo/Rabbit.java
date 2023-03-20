package com.inter.model.vo;

import com.inter.common.MotionAble;

public class Rabbit extends Animal implements MotionAble {

	@Override
	public void bark() {
		System.out.println("끼이이이깅루기");
	}
	@Override
	public void foward() {
		System.out.println("깡총깡총 앞으로");
	}
		
	@Override 
	public void back() {
		System.out.println("깡총깡총 뒤로");
	}
	
	@Override
	public void jump() {
		System.out.println("깡총깡총 점프");
	}
}

