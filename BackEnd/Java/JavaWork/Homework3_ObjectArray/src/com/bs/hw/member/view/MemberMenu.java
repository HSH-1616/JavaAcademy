package com.bs.hw.member.view;

import java.util.Scanner;

import javax.xml.transform.Templates;

import com.bs.hw.member.controller.MemberController;

public class MemberMenu {
	Scanner sc = new Scanner(System.in);
	MemberController mc = new MemberController();

	public void mainMenu() {
		int menuNum = 0;
		while (menuNum != 9) {
			System.out.println("최대 등록 가능한 회원수는 " + mc.SIZE + "명 입니다.");
			System.out.println("현재 등록된 회원 수는 " + mc.existMemberNum() + "명 입니다.");

			if (mc.existMemberNum() != mc.SIZE) {
				System.out.println("1. 새 회원 등록");
				System.out.println("2. 회원 검색");
				System.out.println("3. 회원 정보 수정");
				System.out.println("4. 회원 삭제");
				System.out.println("5. 모두 출력");
				System.out.println("9. 끝내기");
				System.out.print("메뉴 번호 : ");
				menuNum = sc.nextInt();
				
				switch (menuNum) {
				case 1:
					insertMember();
					break;
				case 2:
					searchMember();
					break;
				case 3:
					updateMember();
					break;
				case 4:
					deleteMember();
					break;
				case 5:
					printAll();
					break;
				case 9:
					System.out.println("시스템을 종료합니다");
					break;
				default:
					System.out.println("잘못 입력하셨습니다.\n");
					break;
				}

			} else if (mc.existMemberNum() == mc.SIZE) {
				System.out.println("회원 수가 모두 꽉 찼기 때문에 일부 메뉴만 오픈됩니다.");
				System.out.println("2. 회원 검색");
				System.out.println("3. 회원 정보 수정");
				System.out.println("4. 회원 삭제");
				System.out.println("5. 모두 출력");
				System.out.println("9. 끝내기");
				System.out.print("메뉴 번호 : ");
				menuNum = sc.nextInt();

				switch (menuNum) {
				case 2:
					searchMember();
					break;
				case 3:
					updateMember();
					break;
				case 4:
					deleteMember();
					break;
				case 5:
					printAll();
					break;
				case 9:
					System.out.println("시스템을 종료합니다");
					break;
				}

			}
		}
	}

	public void insertMember() {

		System.out.println("새 회원을 등록합니다.");
		System.out.print("아이디 : ");
		String id = sc.next();
		while (mc.checkId(id) == false) {
			System.out.println("아이디가 중복 되었습니다. 다시 입력 해주세요.");
			System.out.print("아이디 : ");
			id = sc.next();
		}
		System.out.print("이름 : ");
		String name = sc.next();

		System.out.print("비밀 번호 : ");
		String password = sc.next();

		System.out.print("이메일 : ");
		String email = sc.next();

		System.out.print("성별(M/F) : ");
		char gender = sc.next().charAt(0);
		while (gender != 'M' && gender != 'F') {
			System.out.println("성별을 다시 입력하세요.");
			System.out.print("성별(M/F) : ");
			gender = sc.next().charAt(0);
		}
		System.out.print("나이 : ");
		int age = sc.nextInt();
		System.out.println();

		mc.insertMember(id, name, password, email, gender, age);
	}

	public void searchMember() {
		System.out.println("1. 아이디로 검색하기\n2. 이름으로 검색하기\n3. 이메일로 검색하기\n9. 메인으로 돌아가기");
		System.out.print("메뉴 번호 : ");		
		int menuNum = sc.nextInt();
		
		switch (menuNum) {
		case 1:
			searchId();
			break;
		case 2:
			searchName();
			break;
		case 3:
			searchEmail();
			break;
		case 9:
			System.out.println("메인으로 돌아갑니다.\n");
			return;
		default:
			System.out.println("잘못 입력하셨습니다.");
			return;

		}

	}

	public void searchId() {
		System.out.print("검색할 아이디 : ");
		String id = sc.next();
		mc.searchId(id);
		System.out.println("찾으신 회원 조회 결과입니다.");
		System.out.println(mc.searchId(id) + "\n");
	}

	public void searchName() {
		System.out.print("검색할 이름 : ");
		String name = sc.next();
		mc.searchName(name);

		if (mc.searchName(name) != null) {
			System.out.println("찾으신 회원 조회 결과입니다.");
			for (int i = 0; i < mc.SIZE; i++) {
				if (mc.searchName(name)[i] != null) {
					System.out.println(mc.searchName(name)[i].inform());
				}
			}
			System.out.println();
		} else if (mc.searchName(name) == null) {
			System.out.println("찾으신 결과가 없습니다.\n");
		}

	}

	public void searchEmail() {
		System.out.print("검색할 이메일 : ");
		String email = sc.next();
		mc.searchEmail(email);

		if (mc.searchEmail(email) != null) {
			System.out.println("찾으신 회원 조회 결과입니다.");
			for (int i = 0; i < mc.SIZE; i++) {
				if (mc.searchEmail(email)[i] != null) {
					System.out.println(mc.searchEmail(email)[i].inform());
				}
			}
			System.out.println();
		} else if (mc.searchEmail(email) == null) {
			System.out.println("찾으신 결과가 없습니다.\n");
		}
	}

	public void updateMember() {
		System.out.println("1. 비밀번호 수정하기\n2. 이름수정하기\n3. 이메일 수정하기\n9. 메인으로 돌아가기");
		System.out.print("메뉴 번호 : ");
		int menuNum = sc.nextInt();
		
		switch (menuNum) {
		case 1:
			updatePassword();
			break;
		case 2:
			updateName();
			break;
		case 3:
			updateEmail();
			break;
		case 9:
			System.out.println("메인으로 돌아갑니다.\n");
			return;
		default:
			System.out.println("잘못 입력하셨습니다.\n");
			return;
		}
	}

	public void updatePassword() {
		System.out.print("수정할 회원의 아이디 : ");
		String id = sc.next();
		System.out.print("수정할 비밀번호 : ");
		String password = sc.next();
		mc.updatePassword(id, password);

		if (mc.updatePassword(id, password) == true) {
			System.out.println("수정이 성공적으로 되었습니다.\n");
		} else {
			System.out.println("존재하지 않는 아이디입니다.\n");
		}
	}

	public void updateName() {
		System.out.print("수정할 회원의 아이디 : ");
		String id = sc.next();
		System.out.print("수정할 이름 : ");
		String name = sc.next();
		mc.updateName(id, name);

		if (mc.updateName(id, name) == true) {
			System.out.println("수정이 성공적으로 되었습니다.\n");
		} else {
			System.out.println("존재하지 않는 아이디입니다.\n");
		}
	}

	public void updateEmail() {
		System.out.print("수정할 회원의 아이디 : ");
		String id = sc.next();
		System.out.print("수정할 이메일 : ");
		String email = sc.next();
		mc.updateEmail(id, email);

		if (mc.updateEmail(id, email) == true) {
			System.out.println("수정이 성공적으로 되었습니다.\n");
		} else {
			System.out.println("존재하지 않는 아이디입니다.\n");
		}
	}

	public void deleteMember() {
		System.out.println("1. 특정 회원 삭제하기\n2. 모든 회원 삭제하기\n9. 메인으로 돌아가기");
		System.out.print("메뉴 번호 : ");
		int menuNum = sc.nextInt();

		switch (menuNum) {
		case 1:
			deleteOne();
			break;
		case 2:
			deleteAll();
			break;
		case 9:
			System.out.println("메인으로 돌아갑니다.\n");
			return;
		default:
			System.out.println("잘못 입력하셨습니다.\n");
			return;
		}
	}

	public void deleteOne() {
		System.out.print("삭제할 회원의 아이디 : ");
		String id = sc.next();

		System.out.print("정말 삭제하시겠습니까?(y/n) : ");
		char delete = sc.next().charAt(0);

		if (delete == 'y') {
			if (mc.delete(id) == true) {
				System.out.println("성공적으로 삭제하였습니다.\n");
			} else {
				System.out.println("존재하지 않는 아이디입니다.\n");
			}
		}
	}

	public void deleteAll() {
		System.out.print("정말 삭제하시겠습니까?(y/n) : \n");
		char delete = sc.next().charAt(0);

		if (delete == 'y') {
			mc.delete();
			System.out.println("성공적으로 삭제하였습니다.\n");
		}
	}

	public void printAll() {
		for (int i = 0; i < mc.SIZE; i++) {
			if (mc.printAll()[i] != null) {
				System.out.println(mc.printAll()[i].inform() + "\n");
			}else {
				System.out.println("저장된 회원이 없습니다.\n");
				break;
			}
		}
	}

}
