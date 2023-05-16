package com.obj.run;

import com.obj.basiccontroller.MyMethod;

public class MyMethodRun {
	
	public static void main(String[] args) {
		
		MyMethod mm=new MyMethod();
		
		mm.printMsg();
		
		int result=mm.sumNumber();
		System.out.println(result);
		
		System.out.println(mm.printMsgSum());
		
		mm.calculator(1,2,'-');
		
		double result1=mm.calculator2(1,2,'+');
		System.out.println(result1);
		
		boolean flag=mm.checkStr("apple");
		System.out.println(flag);
	}
}
