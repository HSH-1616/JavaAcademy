package com.bs.practice.list.library.controller;

import java.util.ArrayList;

import com.bs.practice.list.library.model.vo.Book;

public class BookController {
	
	ArrayList list = new ArrayList();
	
	public BookController() {
		// TODO Auto-generated constructor stub
	}
	
	public void insertBook(Book bk) {
		list.add(new Book(bk.title,bk.author,bk.category,bk.price));
		
	}
}
