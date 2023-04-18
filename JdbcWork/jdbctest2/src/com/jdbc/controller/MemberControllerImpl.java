package com.jdbc.controller;

import java.util.List;

import com.jdbc.common.MemberController;
import com.jdbc.model.dto.MemberDTO;
import com.jdbc.model.service.MemberService;
import com.jdbc.view.MainView;

public class MemberControllerImpl implements MemberController {

//	private MemberDao dao=new MemberDao();
	private MemberService service=new MemberService();
	
	@Override
	public void mainMenu() {
		new MainView().mainMenu();
		
	}
	
	@Override
	public void selectMemberById() {
		String id=new MainView().inputData("아이디");
		MemberDTO m=service.selectMemberById(id);
		new MainView().printMember(m);
		
	}

	@Override
	public void selectAllMember() {
		// TODO Auto-generated method stub
		List<MemberDTO> members=service.selectAllMember();
		new MainView().printMembers(members);
		
	}

	@Override
	public void insertMember() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectMemberByName() {
		// TODO Auto-generated method stub
		
	}
	
}
