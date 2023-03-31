package com.bs.practice.list.library.view;

import java.util.ArrayList;
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
			sc.nextLine();
			switch (menuNum) {
			case 1:
				insertBook();
				break;
			case 2:
				selectList();
				break;
			case 3:
				searchBook();
				break;
			case 4:
				deleteBook();
				break;
			case 5:
				ascBook();
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

	public void insertBook() {
		System.out.print("도서 명 : ");
		String title = sc.next();
		System.out.print("저자 명 : ");
		String author = sc.next();
		System.out.print("장르(1. 인문 / 2. 과학 / 3. 외국어 / 4. 기타) : ");
		int category = sc.nextInt();
		System.out.print("가격 : ");
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

	public void selectList() {
		ArrayList<Book> booklist = bc.selectList();

		if (booklist.isEmpty()) {
			System.out.println("검색 결과가 없습니다.");
		} else {
			booklist.forEach(o -> System.out.println(o));
		}
	}

	public void searchBook() {
		System.out.print("검색 키워드 : ");
		String keyword = sc.nextLine();

		if (bc.searchBook(keyword).isEmpty()) {
			System.out.println("검색 결과가 없습니다.");
		} else {
			bc.searchBook(keyword).forEach(o -> System.out.println(o));
		}
	}

	public void deleteBook() {
		System.out.print("삭제할 도서 명 : ");
		String title = sc.nextLine();
		System.out.print("삭제할 저자 명 : ");
		String author = sc.next();		
		
		if (bc.deleteBook(title, author)!=null) {
			System.out.println("성공적으로 삭제되었습니다.");
		} else if(bc.deleteBook(title, author) == null){
			System.out.println("삭제할 도서를 찾지 못했습니다.");
		}					
	}
	
	public void ascBook() {
		if(bc.ascBook()==1) {
			System.out.println("정렬에 성공하였습니다.");
		}else {
			System.out.println("정렬에 실패하였습니다.");
		}
		
	}
	

}
