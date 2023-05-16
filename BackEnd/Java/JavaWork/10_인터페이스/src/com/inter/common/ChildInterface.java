package com.inter.common;
//ParentInterface상속받기
public interface ChildInterface 
				extends ParentInterface, Flyable{
	
	void printTest(String str);
}
