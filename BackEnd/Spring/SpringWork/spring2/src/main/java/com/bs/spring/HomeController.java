package com.bs.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.spring.beantest.Animal;

@Controller
public class HomeController {
	
	//springbean으로 등록된 객체는 필드로 가져와 사용할수 있음
	@Autowired
	private Animal a;
	
	@RequestMapping("/")
	public String home() {
		System.out.println(a);
		return "index";
	}
}
