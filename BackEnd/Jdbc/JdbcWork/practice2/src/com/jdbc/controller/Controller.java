package com.jdbc.controller;

import java.util.List;

import com.jdbc.model.dto.MemberDTO;
import com.jdbc.model.service.Service;
import com.jdbc.view.MainView;

public class Controller {
	
	MainView v;
	Service s=new Service();
	
	public void memberControl() {
		v=new MainView();
		v.memberControl();
	}
	
	public void selectAllMember() {
		List<MemberDTO> m=s.selectAllMember();
		v=new MainView();
		v.printMembers(m);
	}
	
	public void selectMemberId() {
		v=new MainView();
		String id=v.inputMember("아이디");
		MemberDTO m=s.selectMemberId(id);
		v.printMember(m);
	}
	
	public void selectMemberName() {
		v=new MainView();
		String name=v.inputMember("이름");
		List<MemberDTO> m=s.selectMemberName(name);
		v.printMembers(m);
	}
	
	public void insertMember() {
		v=new MainView();
		MemberDTO m=v.insertMember();
		int result=s.insertMember(m);
		v.printMsg(result>0?"회원 등록 성공":"회원 등록 실패");
	}
}
