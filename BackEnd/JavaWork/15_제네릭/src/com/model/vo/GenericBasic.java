package com.model.vo;

public class GenericBasic<T,E> {
	
	private T data;
	private E element;
	
	public GenericBasic() {
		// TODO Auto-generated constructor stub
	}
	
	public GenericBasic(T data) {
		this.data=data;
	}
	
	public T getData() {
		return this.data;
	}
	
	public void setData(T data) {
		this.data=data;
	}
	
}
