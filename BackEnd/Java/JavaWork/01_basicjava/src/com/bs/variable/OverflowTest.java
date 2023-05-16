package com.bs.variable;

public class OverflowTest {
	public static void main(String[] args) {
		//overflowtest
		byte b=100;
		for(int i=0;i<10000;i++) {
			b+=1;//b=b+1;
			System.out.println(b);
		}	
	}
}
