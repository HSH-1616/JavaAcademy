package com.obj.run;

import com.obj.basiccontroller.MyMethod;

public class MyMethodRun {
	
	public static void main(String[] args) {
		
		MyMethod mm=new MyMethod();
		
		mm.lunch();
		
		int result=mm.calc();
		System.out.println(result);
		
		System.out.println(mm.msg());
		
		mm.calc1(1,2,'-');
		
		double result1=mm.calcReturn(1,2,'+');
		System.out.println(result1);
		
		boolean flag=mm.checkStr("apple");
		System.out.println(flag);
	}
}
