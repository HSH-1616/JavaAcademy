package com.bs.practice.charCkeck.controller;

import javax.xml.validation.Validator;

import com.bs.practice.charCkeck.exception.CharCheckException;

public class CharacterController {

	public CharacterController() {
	}

	public int countAlpha(String s) throws CharCheckException {
		int count = 0;
		for (int i = 0; i < s.length(); i++) {
			if (s.charAt(i) == ' ') {
				throw new CharCheckException("체크할 문자열 안에 공백이 포함되어 있습니다.");
			}else if(s.charAt(i)>='A'&&s.charAt(i)<'z') {
				count++;
			}
		}
		return count;
	}
}
