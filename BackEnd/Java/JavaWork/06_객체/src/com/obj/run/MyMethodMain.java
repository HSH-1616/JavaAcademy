package com.obj.run;

import com.obj.basiccontroller.MyMethod;

public class MyMethodMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyMethod mmt=new MyMethod();
		mmt.printMsg();
		//String sumMsg=mmt.printMsgSum();
		//System.out.println(sumMsg);
		//System.out.println(mmt.printMsgSum());
		mmt.calculator(10, 20, '*');
		double result=mmt.calculator2(10, 20, '*');
		System.out.println(result);
//		if(mmt.calculator2(10, 20, '*')<100) {
//			
//		}
		
		boolean flag=mmt.checkStr("aple");
		System.out.println(flag);
		
		if(mmt.checkStr("apple")) {
			System.out.println("중복값이 있습니다");
		}else {
			System.out.println("중복값이 없습니다");
		}
		
		
		
	}

}
