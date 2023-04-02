package com.bs.practice.list.library.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.bs.practice.list.library.model.vo.Book;

public class BookController {
	
	ArrayList list = new ArrayList();
	
	public BookController() {
		list.add(new Book("자바의 정석","남궁성","기타",20000));
		list.add(new Book("쉽게 배우는 알고리즘","문병로","기타",15000));
		list.add(new Book("대화의 기술","강보람","인문",17500));
		list.add(new Book("암 정복기","박신우","의료",21000));
	}
	
	public void insertBook(Book bk) {
		list.add(new Book(bk.title,bk.author,bk.category,bk.price));		
	}
	
	public ArrayList selectList() {
		return list;
	}
	
	public ArrayList searchBook(String keyword) {
		ArrayList searchList=new ArrayList();
		
		for(int i=0;i<list.size();i++) {
		boolean result= ((Book)list.get(i)).getTitle().contains(keyword);
			if(result) {
				searchList.add(list.get(i));
			}
		}								
		return searchList;
	}
	
	public Book deleteBook(String title, String author) {
		Book removeBook=new Book();
		removeBook=null;
		
		for(int i=0;i<list.size();i++) {		
			if(((Book)list.get(i)).getTitle().equals(title)
					&&((Book)list.get(i)).getAuthor().equals(author)) {				
				removeBook=(Book)list.get(i);
				list.remove(i);	
				break;
			}					
		}
		return removeBook;		
	}
	
	public int ascBook() {
		Collections.sort(list);
		for(Object o : list) {
			System.out.println(o);
		}
		return 1;
	}
	

	
}
