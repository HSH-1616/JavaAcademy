package com.bs.practice.file.view;

import java.util.Scanner;

import com.bs.practice.file.controller.FileController;

public class FileMenu {
	Scanner sc = new Scanner(System.in);
	FileController fc = new FileController();

	public void mainMenu() {

		int menuNum = 0;

		while (menuNum != 9) {
			System.out.println("**** My Note ****");
			System.out.println("1. 노트 새로 만들기\n2. 노트 열기\n3. 노트 열어서 수정하기\n9. 끝내기");
			System.out.print("메뉴 번호 : ");			
			menuNum = sc.nextInt();
			System.out.println();
			sc.nextLine();
			switch (menuNum) {
			case 1:
				fileSave();
				break;
			case 2:
				fileOpen();
				break;
			case 3:
				fileEdit();
				break;
			case 9:
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
				break;
			}
		}

	}

	public void fileSave() {

		String msg = "";
		StringBuilder sb = new StringBuilder();

		while (!msg.equals("ex끝it")) {
			System.out.println("파일에 저장할 내용을 입력하세요.\nex끝it 이라고 입력하면 종료됩니다.");
			System.out.print("내용 : ");
			
			msg = sc.nextLine();
			if(msg.equals("ex끝it")) {
				break;
			}
			sb.append(msg+"\n");
		}
		System.out.print("저장할 파일명을 입력해 주세요 : ");
		String fName = sc.next();
		fc.checkName(fName);

		if (fc.checkName(fName)) {
			System.out.print("이미 존재하는 파일입니다. 덮어쓰시겠습니까?(y/n) : ");
			char yn = sc.next().charAt(0);
			if (yn == 'y') {
				fc.fileSave(fName, sb);
			} else if (yn == 'n') {
				System.out.print("저장할 파일명을 입력해 주세요 : ");
				fName = sc.next();
				System.out.println();
				fc.fileSave(fName, sb);
			}
		} else {
			fc.fileSave(fName, sb);
		}
	}

	public void fileOpen() {
		System.out.print("열 파일 명 : ");
		String fName = sc.next();
		if (fc.checkName(fName)) {
			System.out.println(fc.fileOpen(fName));
		} else {
			System.out.println("없는 파일입니다.\n");
		}
	}

	public void fileEdit() {
		System.out.print("수정할 파일 명 : ");
		String fName = sc.next();
		String msg = "";
		StringBuilder sb = new StringBuilder();
		sc.nextLine();
		if (fc.checkName(fName)) {
			while (!msg.equals("ex끝it")) {
				System.out.println("파일에 저장할 내용을 입력하세요.\nex끝it 이라고 입력하면 종료됩니다.");
				System.out.print("내용 : ");
				msg = sc.nextLine();
				System.out.println();
				if(msg.equals("ex끝it")) {
					break;
				}
				sb.append(msg+"\n");
			}
			
			fc.fileEdit(fName, sb);
		} else {
			System.out.println("없는 파일입니다.");
		}
	}

}
