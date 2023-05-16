package com.jcbc.member.controller;

import java.sql.Date;
import java.util.List;

import com.jdbc.member.model.dao.MemberDao;
import com.jdbc.member.model.dto.MemberDTO;
import com.jdbc.view.MainView;

public class MemberController {

	private MemberDao dao = new MemberDao();

	public void mainMenu() {
		new MainView().mainMenu();
		
	}

	// 전체 회원 조회하기
	public void selectAllMember() {
		// Database의 Student 계정에 있는 Member테이블의 모든 데이터를 가져와 출력하는 기능
		// 1.DB에서 Member테이블의 모든 데이터(row) 가져오기 -> DAO클래스 역할
		List<MemberDTO> members=dao.selectAllMember();
		
		// 2.가져온 데이터 출력하기 -> VIew클래스 역할
		new MainView().printMembers(members);		
	}
	
	public void selectMemberById() {
		//DB의 member테이블에서 사용자가 작성한 아이디와 일치한 데이터 가져오기
		//1. 사용자가 아이디를 작성할 수 있게 해줌. -> 화면상에 입력받아옴.(view)
		String inputid=new MainView().inputData("아이디");
		
		//2. 작성한 아이디와 일치하는 아이디(PK)를 DB에서 조회.
		MemberDTO m=dao.selectMemberById(inputid);
			
		//3. 조회한 회원 출력하기
		new MainView().printMember(m);
	}
	
	public void selectMemberByName() {
		//DB의 member테이블에서 이름과 부분일치하는 데이터를 가져와 출력해주는 기능
		String inputName=new MainView().inputData("이름");
		List<MemberDTO> m=dao.selectMemberByName(inputName);
		new MainView().printMembers(m);
	}
	
	public void insertMember() {
		MemberDTO member=new MainView().insertMember();
		int result=dao.insertMember(member);
		
		new MainView().printMsg(result>0?"회원 등록 성공":"회원 등록 실패");
		
	}
	
	public void updateMember() {
		int result=dao.updateMember(new MainView().updateData());
		new MainView().printMsg(result>0?"회원 수정 성공":"회원 수정 실패");
	}

}
