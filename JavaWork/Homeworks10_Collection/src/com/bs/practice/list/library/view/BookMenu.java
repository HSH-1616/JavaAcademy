package com.bs.practice.list.library.view;

import java.util.Scanner;

import com.bs.practice.list.library.controller.BookController;
import com.bs.practice.list.library.model.vo.Book;

public class BookMenu {
	Scanner sc = new Scanner(System.in);
	BookController bc = new BookController();

	public void mainMenu() {

		int menuNum = 0;

		while (menuNum != 9) {
			System.out.println("== Welcome BS Library ==");
			System.out.println("******* 메인 메뉴 *******");
			System.out.println("1. 새 도서 추가\n2. 도서 전체 조회\n3. 도서 검색 조회\n4. 도서 삭제\n5 .도서 명 오름차순 정렬\n9. 종료");
			System.out.print("메뉴 번호 선택 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {
			case 1:

			case 9:
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
				break;
			}
		}
	}

	public void insertBook() {
		System.out.print("도서 명 : ");
		String title = sc.next();
		System.out.println("저자 명 : ");
		String author = sc.next();
		System.out.println("장르(1. 인문 / 2. 과학 / 3. 외국어 / 4. 기타) : ");
		int category = sc.nextInt();
		System.out.println("가격 : ");
		int price = sc.nextInt();

		String categorys = "";
		switch (category) {
		case 1:
			categorys = "인문";
			break;
		case 2:
			categorys = "과학";
			break;
		case 3:
			categorys = "외국어";
			break;
		case 4:
			categorys = "기타";
			break;
		}

		Book bk = new Book(title, author, categorys, price);
		bc.insertBook(bk);
		
		
	}

}
