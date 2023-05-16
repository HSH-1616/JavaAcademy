package com.bs.hw.employee.view;

import java.util.Scanner;

import com.bs.hw.employee.controller.EmployeeController;
import com.bs.hw.employee.model.vo.Employee;

public class EmployeeMenu {
	Scanner sc = new Scanner(System.in);
	Employee e = new Employee();
	EmployeeController ec = new EmployeeController();

	public EmployeeMenu() {

		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("1.사원 추가");
			System.out.println("2.사원 수정");
			System.out.println("3.사원 삭제");
			System.out.println("4.사원 출력");
			System.out.println("9.프로그램 종료");
			System.out.print("메뉴 번호를 누르세요 : ");
			menuNum = sc.nextInt();

			switch (menuNum) {
			case 1:
				insertEmp();
				break;
			case 2:
				updateEmp();
				break;
			case 3:
				deleteEmp();
				break;
			case 4:
				printEmp();
				break;
			case 9:
				System.out.println("시스템을 종료합니다.");
				break;
			}
		}

	}

	public void insertEmp() {
		System.out.print("사원 번호 : ");
		e.setEmpNo(sc.nextInt());
//		int empNo=sc.nextInt();
		System.out.print("사원 이름 : ");
		e.setName(sc.next());
//		String name=sc.next();
		System.out.print("사원 성별 : ");
		e.setGender(sc.next().charAt(0));
		System.out.print("전화 번호 : ");
		e.setPhone(sc.next());
		System.out.print("추가 정보를 더 입력하시겠습니까?(y/n) : ");
		char go = sc.next().charAt(0);

		if (go == 'y') {
			System.out.print("사원 부서 : ");
			e.setDept(sc.next());
			System.out.print("사원 연봉 : ");
			e.setSalary(sc.nextInt());
			System.out.print("보너스 율 : ");
			e.setBonus(sc.nextDouble());
		}
//			else {
//			e.setEmpNo(empNo);
//			e.setName(name);
//		}

	}

	public void updateEmp() {
		System.out.println("가장 최신의 사원 정보를 수정하게 됩니다.");
		System.out.println("사원의 어떤 정보를 수정하시겠습니까?");
		System.out.println("1.전화번호\n2.사원 연봉\n3.보너스 율\n9.돌아가기");
		System.out.print("메뉴번호를 누르세요 : ");
		int menuNum = sc.nextInt();
		switch (menuNum) {
		case 1:
			System.out.print("수정할 전화번호 : ");
			e.setPhone(sc.next());
			System.out.println("수정에 성공했습니다.");
			break;
		case 2:
			System.out.print("수정할 사원 연봉 : ");
			e.setSalary(sc.nextInt());
			System.out.println("수정에 성공했습니다.");
			break;
		case 3:
			System.out.print("수정할 보너스 율 : ");
			e.setBonus(sc.nextDouble());
			System.out.println("수정에 성공했습니다.");
			break;
		case 9:
			return;
		}
	}

	public void deleteEmp() {
		System.out.print("정말 삭제 하시겠습니까?(y/n) : ");
		char delete = sc.next().charAt(0);
		if (delete == 'y') {
			ec.remove();
			System.out.println("삭제에 성공했습니다.");
		}
	}

	public void printEmp() {
		if (ec.inform().equals("true")) {
			System.out.println("==== 사원정보 출력 =====\n" + e.printEmployee());
		} else {
			System.out.println("사원정보가 없습니다.");
		}
	}

}
