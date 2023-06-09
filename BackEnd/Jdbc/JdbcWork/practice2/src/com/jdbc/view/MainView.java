package com.jdbc.view;

import java.util.List;
import java.util.Scanner;

import com.jdbc.controller.Controller;
import com.jdbc.model.dto.MemberDTO;

public class MainView {
//	메인메뉴 
//	   1. 회원관리
//	   2. 게시판관리
//	   3. 프로그램 종료
//
//	회원관리 서브메뉴
//	  1. 전체회원조회
//	  2. 회원 아이디로 조회
//	  3. 회원 이름으로 조회
//	  4. 회원가입
//	  5. 회원정보수정(주소, 전화번호, 이메일)
//	  6. 회원탈퇴
//	  7. 메인메뉴로
//
//	게시판 서브메뉴
//	  1. 게시판전체 검색
//	  2. 게시물 등록
//	  3. 작성자로 검색
//	  4. 제목으로 검색
//	  5. 게시물 수정(제목, 내용) idx로 수정
//	  6. 게시물 삭제
//	  7. 메인메뉴로
//
//
//	MVC패턴(템플릿 클래스를 이용, model, view, controller, service)으로 작성하고 
//	proprties를 이용하여 드라이버 등록 및 쿼리문을 불러와서 실행할것.
	Scanner sc = new Scanner(System.in);
	Controller c = new Controller();

	public void mainMenu() {
		while (true) {
			System.out.println("==== 메인 메뉴 ====");
			System.out.println("1. 회원 관리");
			System.out.println("2. 게시판 관리");
			System.out.println("3. 프로그램 종료");
			System.out.print("메뉴 선택 : ");
			int num = sc.nextInt();
			switch (num) {
			case 1:
				c.memberControl();
				break;
			case 3:
				System.out.println("프로그램을 종료합니다.");
				return;
			}
		}
	}

	public void memberControl() {
		System.out.println("==== 회원 관리 ====");
		System.out.println("1.전체 회원 조회");
		System.out.println("2.회원 아이디로 조회");
		System.out.println("3.회원 이름으로 조회");
		System.out.println("4.회원 가입");
		System.out.println("5.회원 정보 수정(주소, 전화번호, 이메일)");
		System.out.println("6.회원 탈퇴)");
		System.out.println("7.메인 메뉴");
		System.out.print("메뉴 선택 : ");
		int num = sc.nextInt();
		switch (num) {
		case 1:
			c.selectAllMember();
			break;
		case 2:
			c.selectMemberId();
			break;
		case 3:
			c.selectMemberName();
			break;
		case 4:
			c.insertMember();
			break;
		}
	}

	public String inputMember(String title) {
		System.out.println("==== 회원 " + title + " 조회 ====");
		System.out.print("입력 : ");
		return sc.next();
	}
	
	public MemberDTO insertMember() {
		MemberDTO m=new MemberDTO();
		
		System.out.println("==== 등록할 회원 입력 ====");
		System.out.print("아이디 : ");		
		m.setMemberId(sc.next());
		System.out.print("비밀번호 : ");
		m.setMemberPwd(sc.next());
		System.out.print("이름 : ");
		m.setMemberName(sc.next());
		System.out.print("이메일 : ");
		m.setEmail(sc.next());
		System.out.print("주소 : ");
		m.setAddress(sc.nextLine());
		sc.nextLine();
		System.out.print("전화번호 : ");
		m.setPhone(sc.next());
		
		return m;
	}
	
	public void printMsg(String msg) {
		System.out.println("==== 시스템 메세지 ====");
		System.out.println(msg);
		System.out.println("===================");
	}

	public void printMembers(List<MemberDTO> m) {
		System.out.println("====== 조회된 회원 ======");
		m.forEach(e -> System.out.println(e != null ? e : "검색 결과가 없습니다."));
		System.out.println("=======================");
	}

	public void printMember(MemberDTO m) {
		System.out.println("====== 조회된 회원 ======");
		System.out.println(m != null ? m : "검색 결과가 없습니다.");
		System.out.println("=======================");
	}

}
