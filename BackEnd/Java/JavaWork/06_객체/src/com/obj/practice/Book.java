package com.obj.practice;

public class Book {
	private String title;
	private String publisher;
	private String author;
	private int price;
	private double discountRate;
	
	
	
	Book(){}
	
	Book(String title,String publisher,String author)	{
		this.title=title;
		this.publisher=publisher;
		this.author=author;
	}
	
	public void inform1() {
		System.out.println(title+" "+publisher+" "+author);
	}
	
	Book(String title,String publisher,String author,
			int price,double discountRate)	{
		this.title=title;
		this.publisher=publisher;
		this.author=author;
		this.price=price;
		this.discountRate=discountRate;
	}
	
	public void inform() {
		System.out.println(title+" "+publisher+" "+author+" "+price+" "+discountRate);
	}
	
	
}
