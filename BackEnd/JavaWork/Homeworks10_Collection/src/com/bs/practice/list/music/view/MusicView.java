package com.bs.practice.list.music.view;

import java.util.ArrayList;
import java.util.Scanner;

import com.bs.practice.list.music.controller.MusicController;
import com.bs.practice.list.music.model.vo.Music;

public class MusicView {

	Scanner sc = new Scanner(System.in);
	MusicController mc = new MusicController();

	public void mainMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("******* 메인 메뉴 ********");
			System.out.println("1. 마지막 위치에 곡추가\n2. 첫 위치에 곡 추가\n3. 전체 곡 목록 출력\n4. 특정 곡 검색"
					+ "\n5. 특정 곡 삭제\n6. 특정 곡 정보 수정\n7. 곡명 오름차순 정렬\n8. 가수명 내림차순 정렬\n9. 종료");
			System.out.print("메뉴 번호 선택 : ");
			menuNum = sc.nextInt();
			sc.nextLine();
			switch (menuNum) {
			case 1:
				addList();
				break;
			case 2:
				addAtZero();
				break;
			case 3:
				printAll();
				break;
			case 4:
				searchMusic();
				break;
			case 5:
				removeMusic();
				break;
			case 6:
				setMusic();
				break;
			case 7:
				ascTitle();
				break;
			case 8:
				descSinger();
				break;
			case 9:
				System.out.println("프로그램 종료");
				break;
			default:
				System.out.println("잘못 입력 하셨습니다. 다시 입력 해주세요.");
				break;
			}
		}
	}

	public void addList() {
		System.out.println("****** 마지막 위치에 곡추가 ******");
		System.out.print("곡명 : ");
		String title = sc.nextLine();
		System.out.print("가수 명 : ");
		String singer = sc.nextLine();

		Music m = new Music();
		m.setTitle(title);
		m.setSinger(singer);

		if (mc.addList(m) == 1) {
			System.out.println("추가 성공");
		} else {
			System.out.println("추가 실패");
		}
	}

	public void addAtZero() {
		System.out.println("****** 첫 위치에 곡 추가 ******");
		System.out.print("곡명 : ");
		String title = sc.nextLine();
		System.out.print("가수 명 : ");
		String singer = sc.nextLine();

		Music m = new Music();
		m.setTitle(title);
		m.setSinger(singer);

		if (mc.addAtZero(m) == 1) {
			System.out.println("추가 성공");
		} else {
			System.out.println("추가 실패");
		}
	}

	public void printAll() {
		System.out.println("****** 전체 곡 목록 출력 ****** ");
		System.out.print("[");
		for (int i = 0; i < mc.printAll().size(); i++) {
			if (i + 1 != mc.printAll().size()) {
				System.out.print(mc.printAll().get(i) + ", ");
			} else {
				System.out.print(mc.printAll().get(i));
			}
		}
		System.out.println("]");
	}

	public void searchMusic() {
		System.out.println("****** 특정 곡 검색 ****** ");
		System.out.print("검색할 곡 명 : ");
		String title = sc.nextLine();

		if (mc.searchMusic(title) == null) {
			System.out.println("검색한 곡이 없습니다.");
		} else {
			System.out.println(mc.searchMusic(title));
		}

	}

	public void removeMusic() {
		System.out.println("****** 특정 곡 삭제 ****** ");
		System.out.print("삭제할 곡 명 : ");
		String title = sc.nextLine();
		mc.removeMusic(title);
		

	}

	public void setMusic() {
		System.out.println("****** 특정 곡 정보 수정 ****** ");
		System.out.print("검색할 곡 명 : ");
		String title = sc.nextLine();

		System.out.print("수정할 곡 명 : ");
		String title1 = sc.nextLine();
		System.out.print("수정할 가수 명 : ");
		String singer = sc.nextLine();

		Music m = new Music();
		m.setTitle(title1);
		m.setSinger(singer);

		if (mc.setMusic(title, m) == null) {
			System.out.println("수정할 곡이 없습니다.");
		} else {
			System.out.println(mc.setMusic(title, m) + "가 값이 변경되었습니다.");
		}
	}

	public void ascTitle() {
		System.out.println("****** 곡 명 오름차순 정렬 ****** ");
		if (mc.ascTitle() == 1) {
			System.out.println("정렬 성공");
		} else {
			System.out.println("정렬 실패");
		}
	}

	public void descSinger() {
		System.out.println("****** 가수 명 내림차순 정렬 ****** ");
		if (mc.descSinger() == 1) {
			System.out.println("정렬 성공");
		} else {
			System.out.println("정렬 실패");
		}
	}

}
