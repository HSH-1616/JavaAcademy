package com.bs.practice.set.controller;

import java.util.HashSet;

import com.bs.practice.set.model.vo.Lottery;

public class LotteryController {
	HashSet lottery=new HashSet();
	HashSet win=new HashSet();
	
	public boolean insertObject(Lottery l) {
		boolean flag=false;
		
		if(!lottery.contains(l)) {
			lottery.add(l);
			flag=true;
		}		
		return flag;
	}	
}
