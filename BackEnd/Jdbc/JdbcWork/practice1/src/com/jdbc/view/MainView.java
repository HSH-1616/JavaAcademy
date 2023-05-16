package com.jdbc.view;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.jdbc.controller.Controller;
import com.jdbc.model.dto.ModelDTO;

public class MainView {


	public void mainMenu() {
		Scanner sc = new Scanner(System.in);
		Controller c = new Controller();
		while (true) {
			System.out.println("1. 전체 사원조회");
			System.out.println("2. 사원 조회");
			System.out.println("3. 사원 등록");
			System.out.println("4. 사원 수정(직책, 부서, 급여, 전화번호, 이메일)");
			System.out.println("5. 사원 삭제");
			System.out.println("6. 부서 관리");
			System.out.println("7. 직책 관리");
			System.out.println("0. 종료");
			System.out.print("입력 : ");
			int num = sc.nextInt();
			switch (num) {
			case 1:
				c.selectAllMember();
				break;
			case 2:
				c.selectEmp();
				break;
			case 3:
				c.insertEmp();
				break;
			case 4:
				c.updateEmp();
				break;
			case 5:
				c.deleteEmp();
				break;
			case 6:
				c.selectDept();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("없는 메뉴입니다 다시 선택하세요");
			}
		}
	}

	public void printMembers(List<ModelDTO> m) {
		System.out.println("==== 전체 조회 ====");
		if (m.isEmpty()) {
			System.out.println("조회 실패");
		} else {
			m.forEach(e -> System.out.println(e));
		}
	}

	public String[] selectEmp() {
		Scanner sc = new Scanner(System.in);
		System.out.println("==== 항목별 검색 ====");
		System.out.println("1. 부서, 2. 직책, 3. 이름  4.급여");
		System.out.print("입력 : ");
		int num = sc.nextInt();
		String col = "";

		switch (num) {
		case 1:
			col = "DEPT_CODE";
			break;
		case 2:
			col = "JOB_CODE";
			break;
		case 3:
			col = "EMP_NAME";
			break;
		case 4:
			col = "SALARY";
			break;
//		case 4:
//			System.out.println("메인으로 돌아갑니다.");
//			mainMenu();
//			break;
//		default:
//			System.out.println("없는 메뉴입니다 다시 선택하세요");
//			break;
		}
		System.out.print("검색어 : ");
		String sub = sc.next();

		String ud = null;
		if (num == 4) {
			System.out.println("1.입력한 값보다 높은 월급, 2.입력한 값보다 낮은 월급");
			System.out.print("입력 : ");
			ud = sc.next();
			if (ud.equals("1")) {
				ud = ">";
			} else if (ud.equals("2")) {
				ud = "<";
			}
		}
		String[] total = { col, sub, ud };
		return total;
	}

	public ModelDTO insertEmp() {
		Scanner sc = new Scanner(System.in);
		ModelDTO m = new ModelDTO();

		System.out.println("==== 등록할 사원 입력 ====");
		System.out.print("사원번호 : ");
		int id = sc.nextInt();
		m.setEmpId(id);
		System.out.print("이름 : ");
		String name = sc.next();
		m.setEmpName(name);
		System.out.print("주민번호 : ");
		String empNo = sc.next();
		m.setEmpNo(empNo);
		System.out.print("이메일 : ");
		String email = sc.next();
		m.setEmail(email);
		System.out.print("전화번호 : ");
		String phone = sc.next();
		m.setPhone(phone);
		System.out.print("부서코드 : ");
		String deptCode = sc.next();
		m.setDeptCode(deptCode);
		System.out.print("직급코드 : ");
		String jobCode = sc.next();
		m.setJobCode(jobCode);
		System.out.print("급여등급 : ");
		String salLevel = sc.next();
		m.setSalLevel(salLevel);
		System.out.print("월급 : ");
		int salary = sc.nextInt();
		m.setSalary(salary);
		System.out.print("보너스 : ");
		double bonus = sc.nextDouble();
		m.setBonus(bonus);
		System.out.print("매니저번호 : ");
		int managerId = sc.nextInt();
		m.setManagerId(managerId);
		return m;
	}

	public ModelDTO updateEmp() {
		Scanner sc = new Scanner(System.in);
		ModelDTO m = new ModelDTO();

		System.out.println("==== 수정할 정보 입력 ====");
		System.out.print("수정할 사원번호 : ");
		m.setEmpId(sc.nextInt());
		System.out.print("직책 : ");
		m.setDeptCode(sc.next());
		System.out.print("부서 : ");
		m.setJobCode(sc.next());
		System.out.print("전화번호 : ");
		m.setPhone(sc.next());
		System.out.print("이메일 : ");
		m.setEmail(sc.next());

		return m;
	}

	public int deleteEmp() {
		Scanner sc = new Scanner(System.in);

		System.out.println("==== 삭제할 사원번호 입력 ====");
		System.out.print("삭제할 사원번호 : ");
		int num = sc.nextInt();
		return num;
	}

	public List selectDept() {
		Scanner sc = new Scanner(System.in);
		List arr=new ArrayList();
		ModelDTO m = new ModelDTO();
		
		System.out.println("==== 부서 관리 ====");
		System.out.println("1.등록, 2.수정, 3.삭제");
		System.out.print("입력 : ");
		int num = sc.nextInt();

		switch (num) {
		case 1:
			System.out.println("==== 부서 등록 ====");
			System.out.print("부서 코드 : ");
			m.setDeptId(sc.next());
			System.out.print("부서 이름 : ");
			m.setDeptTitle(sc.next());
			System.out.print("지역 코드 : ");
			m.setLocationId(sc.next());
			break;
		case 2:
			System.out.println("==== 부서 수정 ====");
			System.out.print("수정할 부서 코드 : ");
			m.setDeptId(sc.next());
			System.out.print("부서 이름 : ");
			m.setDeptTitle(sc.next());
			System.out.print("지역 코드 : ");
			m.setLocationId(sc.next());
			break;
		case 3:
			System.out.println("==== 부서 삭제 ====");
			System.out.print("삭제할 부서 코드 : ");
			m.setDeptId(sc.next());
			break;
		}

		arr.add(m);
		arr.add(num);	
		
		return arr;
	}

	public void printMsg(String msg) {
		System.out.println("========");
		System.out.println(msg);
		System.out.println("========");
	}

}
