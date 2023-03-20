package com.inter.model.vo;

import com.inter.common.Flyable;
import com.inter.common.MotionAble;
import com.inter.common.Swimable;

public class Duck extends Animal implements Flyable, Swimable, MotionAble{
	
	@Override
	public void swim() {
		System.out.println("오리가 수영중....");
		
	}
	
	@Override
	public void fly() {
		System.out.println("오리가 파닥 파닥....");
	}
	
	@Override
	public void foward() {
		System.out.println("뒤뚱뒤뚱 앞으로");
	}
	
	@Override 
	public void back() {
		System.out.println("뒤뚱뒤뚱 뒤로");
	}
	
	@Override
	public void bark() {
		System.out.println("꽥꽥꽥");
	}
	
	@Override
	public void jump() {
		System.out.println("파다닥! 점프");
	}
}
