package com.obj.practice;

public class Lotto {
	
	private int[] lotto=new int[6];
	
	
	public void information() {
		for(int i=0;i<6;i++) {
			lotto[i]=(int)(Math.random()*45)+1;
			for(int j=0;j<i;j++) {
				if(lotto[i]==lotto[j]) {
					i--;
				}
			}			
		}		
		for(int i=0;i<6;i++) {
			System.out.print(lotto[i]+" ");
		}
		System.err.println();
	}

}
  