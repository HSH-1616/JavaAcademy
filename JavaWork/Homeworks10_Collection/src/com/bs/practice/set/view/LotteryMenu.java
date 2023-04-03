package com.bs.practice.set.view;

import java.util.Scanner;

import com.bs.practice.set.controller.LotteryController;
import com.bs.practice.set.model.vo.Lottery;

public class LotteryMenu {
	LotteryController lc = new LotteryController();
	Scanner sc = new Scanner(System.in);

	public void mainMenu() {
		System.out.println("========== BS 추첨 프로그램 ==========");

		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("******** 메인 메뉴 ********");
			System.out.println("1. 추첨 대상 추가\n2. 추첨 대상 삭제\n3. 당첨 대상 확인\n4. 정렬된 당첨 대상 확인\n5. 당첨 대상 검색\n9. 종료");
			System.out.println("메뉴 번호 선택 : ");
			menuNum = sc.nextInt();
			sc.nextLine();

			switch (menuNum) {
			case 1:
				insertObject();
				break;

			case 9:
				System.out.println("프로그램 종료");
				break;
			default:
				System.out.println("잘못 입력하였습니다. 다시 입력해주세요");
				break;
			}
		}
	}

	public void insertObject() {
		System.out.print("추가할 추첨 대상 수 : ");
		int num = sc.nextInt();
		Lottery l = new Lottery();
		for (int i = 0; i < num; i++) {

			System.out.print("이름 : ");
			String name = sc.next();
			System.out.print("핸드폰 번호('-'빼고) : ");
			String pNum = sc.next();

			l.setName(name);
			l.setPhone(pNum);
			lc.insertObject(l);
			if (lc.insertObject(l) == false) {
				System.out.println("중복된 대상입니다. 다시 입력하세요.");
				System.out.print("이름 : ");
				name = sc.next();
				System.out.print("핸드폰 번호('-'빼고) : ");
				pNum = sc.next();
				l.setName(name);
				l.setPhone(pNum);
				lc.insertObject(l);
			}
			if(i==num-1) {
				System.out.println("추가 완료되었습니다.");
			}
		}

	}

}
