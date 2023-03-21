package com.bs.hw.person.view;

import java.util.Scanner;

import com.bs.hw.person.controller.PersonController;

public class PersonMenu {
	private PersonController pc = new PersonController();
	private Scanner sc = new Scanner(System.in);

	public void mainMenu() {
		int menuNum = 0;

		while (menuNum != 9) {
			System.out.println("학생은 최대 3명까지 저장할 수 있습니다.\n현재 저장된 학생은 " + pc.personCount()[0]
					+ "명입니다.\n사원은 최대 10명까지 저장할 수 있습니다.\n현재 저장된 사원은 " + pc.personCount()[1] + "명입니다.");
			System.out.println("\n1. 학생 메뉴\n2. 사원 메뉴\n9. 끝내기");
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();
			
			switch (menuNum) {
			case 1:
				studentMenu();
				break;
			case 2:
				employeeMenu();
				break;
			case 9:
				System.out.println("종료합니다.");
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요\n");
				break;
			}

		}
	}

	public void studentMenu() {
		int menuNum = 0;
		while (menuNum != 9) {

			System.out.println("\n1. 학생 추가\n2. 학생 보기\n9. 메인으로");
			if (pc.personCount()[0] == 3) {
				System.out.println("학생을 담을수 있는 공간이 꽉 찼기 때문에 학생 추가메뉴는 더이상 활성화 되지 않습니다.");
			}
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();
			if (pc.personCount()[0] == 3 && menuNum == 1) {
				menuNum = 3;
			}
			switch (menuNum) {
			case 1:
				if (pc.personCount()[0] >= 0 && pc.personCount()[0] < 3) {
					insertStudent();
				}
				break;
			case 2:
				printStudent();
				break;
			case 9:
				System.out.println("메인으로 돌아갑니다.\n");
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요");
				break;
			}
		}
	}

	public void employeeMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("\n1. 사원 추가\n2. 사원 보기\n9. 메인으로");
			if (pc.personCount()[1] == 10) {
				System.out.println("사원을 담을수 있는 공간이 꽉 찼기 때문에 사원 추가메뉴는 더이상 활성화 되지 않습니다.");
			}
			System.out.print("메뉴 번호 : ");
			menuNum = sc.nextInt();
			if (pc.personCount()[1] == 10 && menuNum == 1) {
				menuNum = 3;
			}

			switch (menuNum) {
			case 1:
				if (pc.personCount()[1] >= 0 && pc.personCount()[1] < 10) {
					insertEmployee();
				}
				break;
			case 2:
				printEmployee();
				break;
			case 9:
				System.out.println("메인으로 돌아갑니다.\n");
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요");
				break;
			}
		}
	}

	public void insertStudent() {
		char n = '1';
		while (n != 'n' && n != 'N' || pc.personCount()[0] == 3) {
			System.out.print("\n학생 이름 : ");
			String name = sc.next();
			System.out.print("학생 나이 : ");
			int age = sc.nextInt();
			System.out.print("학생 키 : ");
			double height = sc.nextDouble();
			System.out.print("학생 몸무게 : ");
			double weight = sc.nextDouble();
			System.out.print("학생 학년 : ");
			int grade = sc.nextInt();
			System.out.print("학생 전공 : ");
			String major = sc.next();
			pc.insertStudent(name, age, height, weight, grade, major);
			if (pc.personCount()[0] >= 0 && pc.personCount()[0] < 3) {
				System.out.print("그만하시려면 N(또는 n), 이어하시려면 아무 키나 누르세요 : ");
				n = sc.next().charAt(0);
			} else if (pc.personCount()[0] == 3) {
				System.out.println("학생을 담을수 있는 공간이 꽉 찼기 때문에 학생 추가를 종료하고 학생 메뉴로 돌아갑니다.");
				return;
			}
		}
	}

	public void printStudent() {
		for (int i = 0; i < pc.printStudent().length; i++) {
			if (pc.printStudent()[i] != null) {
				System.out.println(pc.printStudent()[i]);
			}
		}
	}

	public void insertEmployee() {
		char n = '1';
		while (n != 'n' && n != 'N' || pc.personCount()[1] == 10) {
			System.out.print("\n사원 이름 : ");
			String name = sc.next();
			System.out.print("사원 나이 : ");
			int age = sc.nextInt();
			System.out.print("사원 키 : ");
			double height = sc.nextDouble();
			System.out.print("사원 몸무게 : ");
			double weight = sc.nextDouble();
			System.out.print("사원 급여 : ");
			int salary = sc.nextInt();
			System.out.print("사원 부서 : ");
			String dept = sc.next();
			pc.insertEmployee(name, age, height, weight, salary, dept);
			if (pc.personCount()[1] >= 0 && pc.personCount()[1] < 10) {
				System.out.print("그만하시려면 N(또는 n), 이어하시려면 아무 키나 누르세요 : ");
				n = sc.next().charAt(0);
			} else if (pc.personCount()[1] == 10) {
				System.out.println("사원을 담을수 있는 공간이 꽉 찼기 때문에 학생 추가를 종료하고 사원 메뉴로 돌아갑니다.\n");
				return;
			}
		}
	}

	public void printEmployee() {
		for (int i = 0; i < pc.printEmployee().length; i++) {
			if (pc.printEmployee()[i] != null) {
				System.out.println(pc.printEmployee()[i]);
			}
		}
	}
}
