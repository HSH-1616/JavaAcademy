package com.bs.practice.numRange.controller;

import com.bs.practice.numRange.exception.NumRangeException;

public class NumberController {

	public NumberController() {
	}

	public boolean checkDouble(int num1, int num2) throws NumRangeException {
		boolean flag = false;
		
		if(num1>=1&&num1<=100&&num2>=1&&num2<=100) {
			if(num1%num2==0) {
				flag= true;
			}else {
				flag= false;
			}
		}
		else if (num1 > 100 || num2 > 100) {
			throw new NumRangeException("1부터 100 사이의 값이 아닙니다.");
		}		
		return flag;
	}
}
