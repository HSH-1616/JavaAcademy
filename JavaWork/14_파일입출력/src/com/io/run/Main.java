package com.io.run;

import java.util.Scanner;

import com.io.controller.FileStreamController;

public class Main {

	public static void main(String[] args) {
		
//		new IOController().filetest();
//		new IOController().fileManager();
//		new FileStreamController().fileSave();
//		new FileStreamController().fileOpen();
//		new FileStreamController().strSave();
//		new FileStreamController().loadStr();
		Scanner sc=new Scanner(System.in);
		System.out.print("저장할 내용 : ");
		String data=sc.nextLine();
		System.out.print("저장할 파일명 : ");
		String fileName=sc.nextLine();
		
		new FileStreamController().saveMsg(data, fileName);
		new FileStreamController().loadMsg(fileName);

		
	}

}
