package com.bs.hw.shape.view;

import java.util.Scanner;

import com.bs.hw.shape.controller.SquareController;
import com.bs.hw.shape.controller.TriangleController;

public class ShapeMenu {

	Scanner sc = new Scanner(System.in);

	public void inputMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("===== 도형 프로그램 =====");
			System.out.println("3.삼각형");
			System.out.println("4.사각형");
			System.out.println("9.프로그램 종료");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {

			case 3:
				triangleMenu();
				break;
			case 4:
				squareMenu();
				break;
			case 9:
				System.out.println("시스템을 종료합니다.");
				break;
				
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요.");
				break;
			}
		}
	}

	public void triangleMenu() {
		int menuNum = 0;
		while (menuNum != 999) {

			System.out.println("===== 삼각형 =====");
			System.out.println("1.삼각형 면적\n2.삼각형 색칠\n3.삼각형 정보\n9.메뉴번호");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {

			case 1:
				inputSize(3, 1);
				break;
			case 2:
				inputSize(3, 2);
				break;
			case 3:
				printInformation(3);
				break;
			case 9:
				System.out.println("메인으로 돌아갑니다.");
				//inputMenu();
				return;
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요.");
				break;
			}
		}
	}

	public void squareMenu() {
		int menuNum = 0;
		while (menuNum != 999) {
			System.out.println("===== 사각형 =====");
			System.out.println("1.사각형 둘레\n2.사각형 면적\n3.사각형 색칠" + "\n4.사각형 정보\n9.메뉴번호");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {

			case 1:
				inputSize(4, 1);
				break;
			case 2:
				inputSize(4, 2);
				break;
			case 3:
				inputSize(4, 3);
				break;
			case 4:
				printInformation(4);
				break;
			case 9:
				System.out.println("메인으로 돌아갑니다.");
				//inputMenu();
				return;
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요.");
				break;
			}
		}
	}

	TriangleController tc = new TriangleController();
	SquareController scr = new SquareController();

	public void inputSize(int type, int menuNum) {
		if (type == 3) {
			switch (menuNum) {
			case 1:
				System.out.print("높이 : ");
				double height = sc.nextDouble();
				System.out.print("너비 : ");
				double weight = sc.nextDouble();
				double ca = tc.calcArea(height, weight);
				System.out.println(ca);
				break;

			case 2:
				System.out.print("색깔을 입력하세요 : ");
				String color = sc.next();
				tc.paintColor(color);
				System.out.println("색이 수정되었습니다");
				break;
			}
		}

		if (type == 4) {
			switch (menuNum) {
			case 1:
				System.out.print("높이 : ");
				double height = sc.nextDouble();
				System.out.print("너비 : ");
				double weight = sc.nextDouble();
				double cp = scr.calcPerimeter(height, weight);
				System.out.println(cp);
				break;

			case 2:
				System.out.print("높이 : ");
				double height1 = sc.nextDouble();
				System.out.print("너비 : ");
				double weight1 = sc.nextDouble();
				double cp1 = scr.calcPerimeter(height1, weight1);
				System.out.println(cp1);
				break;

			case 3:
				System.out.print("색깔을 입력하세요 : ");
				String color = sc.next();
				scr.paintColor(color);
				System.out.println("색이 수정되었습니다.");
				break;
			}
		}
	}

	public void printInformation(int type) {
		if (type == 3) {
			String p = tc.print();
			System.out.println(p);
		}
		if (type == 4) {
			String p1 = scr.print();
			System.out.println(p1);
		}
	}

}
