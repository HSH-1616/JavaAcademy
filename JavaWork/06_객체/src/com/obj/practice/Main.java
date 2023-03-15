package com.obj.practice;

public class Main {

	public static void main(String[] args) {
		
//		Member m=new Member();
//		
//		m.changeName("허성현");
//		m.printName();
//		
//		Product p=new Product();
//		p.information();
//		
//		Circle c=new Circle();
//		c.getAreaOfCircle();
//		c.getSizeOfCircle();
//		
//		c.incrementRadius();
//		
//		c.getAreaOfCircle();
//		c.getSizeOfCircle();
//		
//		Student s=new Student();
//		s.information();
//		
//		Lotto l=new Lotto();
//		for(int i=0;i<3;i++) {
//		l.information();}
//		
		Product2 p2=new Product2();
		p2.setpName("노트북");
		p2.setPrice(1300000);
		p2.setBrand("삼성");
		p2.information();
		
		System.out.println(p2.getpName()+" "+p2.getPrice()+" "+p2.getBrand());
		
		Book b=new Book("책","작가","저자",10000,30.0);
		b.inform();
		Book b1=new Book("이","작가","저자");
		b.inform();
		
		
	}


}
