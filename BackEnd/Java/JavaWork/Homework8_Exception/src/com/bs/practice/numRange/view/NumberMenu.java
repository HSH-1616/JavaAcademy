package com.bs.practice.numRange.view;

import java.util.Scanner;

import com.bs.practice.numRange.controller.NumberController;
import com.bs.practice.numRange.exception.NumRangeException;

public class NumberMenu {
	Scanner sc=new Scanner(System.in);
	NumberController nc=new NumberController();
	
	public void menu() {
		
		System.out.print("정수 1 : ");
		int num1=sc.nextInt();
		System.out.print("정수 2 : ");
		int num2=sc.nextInt();
		
		try {
			System.out.println(num1+"은(는) "+num2+"의 배수인가 ? "+nc.checkDouble(num1,num2));
		}catch(NumRangeException e){
			e.printStackTrace();			
		}		
	}
}
