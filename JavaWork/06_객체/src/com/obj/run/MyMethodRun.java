package com.obj.run;

import com.obj.basiccontroller.MyMethod;

public class MyMethodRun {
	
	public static void main(String[] args) {
		
		MyMethod mm=new MyMethod();
		
		mm.lunch();
		
		int total=mm.calc();
		System.out.println(total);
		
//		mm.msg();
		
		mm.calc1(1,2,'-');
		
	}
}
