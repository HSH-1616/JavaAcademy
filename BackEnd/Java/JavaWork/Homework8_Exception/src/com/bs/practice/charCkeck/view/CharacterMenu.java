package com.bs.practice.charCkeck.view;

import java.util.Scanner;

import com.bs.practice.charCkeck.controller.CharacterController;
import com.bs.practice.charCkeck.exception.CharCheckException;

public class CharacterMenu {
	Scanner sc = new Scanner(System.in);
	CharacterController cc = new CharacterController();
	
	public void menu() {
		
		System.out.print("문자열 : ");
		String msg = sc.nextLine();

		try {			
		System.out.println(msg+"에 포함된 영문자 개수 : "+cc.countAlpha(msg));
		} catch (CharCheckException e) {
			e.printStackTrace();
		}
	}
}
