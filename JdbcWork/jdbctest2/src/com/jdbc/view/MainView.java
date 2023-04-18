package com.jdbc.view;

import java.util.List;
import java.util.Scanner;

import com.jdbc.common.MemberController;
import com.jdbc.controller.MemberControllerImpl;
import com.jdbc.model.dto.MemberDTO;

public class MainView {

	private MemberController controller=new MemberControllerImpl();

	public void mainMenu() {
		Scanner sc = new Scanner(System.in);		
		while (true) {			
			System.out.println("==== jdbc 회원관리 프로그램 ====");
			System.out.println("1. 전체 회원 조회");
			System.out.println("2. 아이디로 회원 조회");
			System.out.println("3. 이름으로 회원 조회");
			System.out.println("4. 회원 등록");
			System.out.println("5. 회원 수정(이름, 나이, 이메일, 주소)");
			System.out.println("0. 프로그램 종료");
			System.out.print("메뉴 선택 : ");
			
			int cho = sc.nextInt();
			switch (cho) {
			case 1:
				controller.selectAllMember();
				break;
			case 2:
				controller.selectMemberById();
				break;
			case 3:
				controller.selectMemberByName();
				break;
			case 4:
				controller.insertMember();
				break;
			case 5:
				controller.updateMember();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("0~5 사이의 메뉴를 입력하세요.");
			}
		}
	}
	
	public void printMembers(List<MemberDTO> members) {
		System.out.println("==== 조회된 결과 ====");
		members.forEach(m->System.out.println(m!=null?m:"검색 결과가 없습니다."));
		System.out.println("==================");
	}
	
	public void printMember(MemberDTO m) {
		System.out.println("==== 조회된 결과 ====");
		System.out.println(m!=null?m:"검색 결과가 없습니다.");
		System.out.println("==================");
	}
	
	public String inputData(String title) {
		Scanner sc=new Scanner(System.in);
		System.out.println("==== 검색할 "+title+"입력 ====");
		System.out.print("입력 : ");
		return sc.nextLine();
	}
	
	public MemberDTO insertMember() {
		Scanner sc=new Scanner(System.in);
		MemberDTO m=new MemberDTO();
		
		System.out.println("==== 등록할 학생 입력 ====");
		System.out.print("아이디 : ");
		String id=sc.next();
		m.setMemberId(id);
		System.out.print("비밀번호 : ");
		String pwd=sc.next();
		m.setMemberPwd(pwd);
		System.out.print("이름 : ");
		String name=sc.next();
		m.setMemberName(name);
		System.out.print("성별(M/F) : ");
		char gender=sc.next().charAt(0);
		m.setGender(gender);
		System.out.print("나이 : ");
		int age=sc.nextInt();
		m.setAge(age);
		System.out.print("이메일 : ");
		String email=sc.next();
		m.setEmail(email);
		System.out.print("전화번호 : ");
		String phone=sc.next();
		m.setPhone(phone);
		sc.nextLine();
		System.out.print("주소 : ");
		String address=sc.nextLine();
		m.setAddress(address);
		System.out.print("취미(,로 구분) : ");		
		String[] hobby=sc.nextLine().split(",");
		m.setHobby(hobby);
		return m;		
	}
	
	public void printMsg(String msg) {
		System.out.println("==== 시스템 메시지 ====");
		System.out.println(msg);
		System.out.println("===================");
	}
	
	public MemberDTO updateData() {
		Scanner sc=new Scanner(System.in);
		MemberDTO m=new MemberDTO();
		System.out.println("==== 회원정보 수정 ==== ");
		System.out.print("수정할 회원아이디 : ");
		m.setMemberId(sc.nextLine());
		System.out.print("새 이름 : ");
		m.setMemberName(sc.nextLine());
		System.out.print("새 나이 : ");
		m.setAge(sc.nextInt());
		sc.nextLine();
		System.out.print("새 주소 : ");
		m.setAddress(sc.nextLine());
		System.out.print("새 이메일 : ");
		m.setEmail(sc.nextLine());
		return m;
	}
}
