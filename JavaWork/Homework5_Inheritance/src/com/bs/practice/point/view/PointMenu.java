package com.bs.practice.point.view;

import java.util.Scanner;

import com.bs.practice.point.controller.CircleController;
import com.bs.practice.point.controller.RectangleController;

public class PointMenu {

	Scanner sc = new Scanner(System.in);
	CircleController cc = new CircleController();
	RectangleController rc = new RectangleController();

	public void mainMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("===== 메뉴 =====");
			System.out.println("1. 원\n2. 사각형\n9. 끝내기");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {
			case 1:
				circleMenu();
				break;
			case 2:
				rectangleMenu();
				break;
			case 9:
				System.out.println("종료합니다.");
				break;
			default:
				System.out.println("잘못 입력 하셨습니다.\n");
				break;
			}
		}
	}

	public void circleMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("\n===== 원 메뉴 =====");
			System.out.println("1. 원 둘레\n2. 원 넓이\n9. 메인으로");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {
			case 1:
				calcCircum();
				return;
				
			case 2:
				calcCircleArea();
				return;
			case 9:
				System.out.println("메인으로 돌아갑니다.\n");
				break;
			default:
				System.out.println("잘못 입력 하셨습니다.\n");
				break;
			}
		}
	}

	public void rectangleMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("\n===== 메뉴 =====");
			System.out.println("1. 사각형 둘레");
			System.out.println("2. 사각형 넓이");
			System.out.println("9. 메인으로");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {
			case 1:
				calcPerimeter();
				return;
			case 2:
				calcArea();
				return;
			case 9:
				System.out.println("메인으로 돌아갑니다.\n");
				break;
			default:
				System.out.println("잘못 입력 하셨습니다.\n");
				break;
			}
		}

	}

	public void calcCircum() {
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		System.out.print("반지름 : ");
		int radious = sc.nextInt();
		System.out.println(cc.calcCircum(x, y, radious)+"\n");
	}

	public void calcCircleArea() {
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		System.out.print("반지름 : ");
		int radious = sc.nextInt();
		System.out.println(cc.calcArea(x, y, radious)+"\n");
	}

	public void calcPerimeter() {
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		System.out.print("높이 : ");
		int height = sc.nextInt();
		System.out.print("너비 : ");
		int width = sc.nextInt();
		System.out.println(rc.calcPerimeter(x, y, height, width)+"\n");

	}

	public void calcArea() {
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		System.out.print("높이 : ");
		int height = sc.nextInt();
		System.out.print("너비 : ");
		int width = sc.nextInt();
		System.out.println(rc.calcArea(x, y, height, width)+"\n");

	}
}
