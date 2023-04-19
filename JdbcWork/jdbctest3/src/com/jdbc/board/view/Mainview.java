package com.jdbc.board.view;

import java.util.List;
import java.util.Map;
import java.util.Scanner;

import com.jdbc.board.controller.BoardController;
import com.jdbc.board.model.dto.Board;

public class Mainview {
	
	public void mainMenu() {
		Scanner sc=new Scanner(System.in);
		BoardController controller=new BoardController();
		while(true) {
			System.out.println("===== 게시글 조회하기 =====");
			System.out.println("1. 게시글 전체 조회하기");
			System.out.println("2. 게시글 항목(제목,내용,작성자) 조회하기");
			System.out.println("0. 프로그램 종료");
			System.out.print("메뉴선택 : ");
			int cho=sc.nextInt();
			switch(cho) {
				case 1 : controller.selectBoardAll();break;
				case 2 : controller.selectSearchBoard();break;
				case 0 : System.out.println("프로그램을 종료합니다.");return;
				default : System.out.println("없는 메뉴입니다 다시 선택하세요");
			}
		}
	}
	
	public void printBoard(List<Board> boards) {
		System.out.println("====== 게시글 리스트 ======");
		if(boards.isEmpty()) {
			System.out.println("조회된 게시글이 없습니다");
		}else {
			boards.forEach(b->System.out.println(""+b.getComments().size()+b));
		}
		System.out.println("=======================");
	}
	
	public Map inputSearch() {
		Scanner sc=new Scanner(System.in);
		System.out.println("==== 게시글 항목별검색 ====");
		System.out.print("항목 1. 제목 2. 내용 3. 작성자 : ");
		int colCho=sc.nextInt();
		sc.nextLine();
		String col="";
		switch(colCho) {
			case 1 : col="board_title";break;
			case 2 : col="board_content";break;
			case 3 : col="board_writer";break;
		}
		System.out.print("검색어 : ");
		String keyword=sc.nextLine();
		return Map.of("col",col,"keyword",keyword);
		
	}
	
	
}
