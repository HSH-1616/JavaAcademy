package com.bs.spring.beantest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

//pojo클래스를 생성하고 선언부에서 bean으로 등록할 수 있다.
//@Component, @Controller, @Service, @Repository
//어노테이션을 이용해서 spring bean으로 등록
//@Component : 기본 spring bean으로 등록할 때 사용
//@Controller, @Service, @Repository : mvc패턴에 의해 역할이 지정된 클래스를 bean으로 등록할때 사용

@Component
//@Data
public class FunctionalTest {
	private String name="test";
	
	//@Autowired
	private Animal a;
	//생성자를 이용한 DI
	public FunctionalTest(@Qualifier("dog") Animal a) {
		this.a=a;
	}
	
	//setter를 이용한 DI
	@Autowired
	public void setA(@Qualifier("dog") Animal a) {
		this.a=a;
	}
	
	public Animal getA() {
		return this.a;
	}
}
