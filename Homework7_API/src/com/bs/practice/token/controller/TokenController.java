package com.bs.practice.token.controller;

public class TokenController {
	
	public TokenController() {		
	}
	
	public String afterToken(String str) {
		String at=str.replaceAll(" ", "");
		return at;
	}
	
	public String firstCap(String input) {
		String fc=input.substring(0,1).toUpperCase()+input.substring(1);
		return fc;
	}
	
	public int findChar(String input, char one) {
		int fch=input.length()-input.replace(String.valueOf(one),"").length();
		return fch;
	}

}
