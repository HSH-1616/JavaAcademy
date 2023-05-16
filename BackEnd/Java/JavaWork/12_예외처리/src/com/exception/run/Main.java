package com.exception.run;

import java.io.FileNotFoundException;
import java.io.IOException;

import com.exception.controller.ExceptionController;

public class Main {

	public static void main(String[] args) {
		// new ExceptionController().uncheckedException();
		try {
			new ExceptionController().exceptionResolve();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		new ExceptionController().makeMyException();
	}
}
