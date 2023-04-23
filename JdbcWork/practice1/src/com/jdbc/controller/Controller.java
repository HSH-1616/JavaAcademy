package com.jdbc.controller;

import java.util.List;

import com.jdbc.model.dto.ModelDTO;
import com.jdbc.model.service.Service;
import com.jdbc.view.MainView;

public class Controller {
	private Service s = new Service();
	private MainView view = new MainView();

	public void mainMenu() {
		view.mainMenu();
	}

	public void selectAllMember() {
		List<ModelDTO> m = s.selectAllMember();
		view.printMembers(m);
	}

	public void selectEmp() {
		String[] total = view.selectEmp();
		List<ModelDTO> m = s.selectEmp(total);
		view.printMembers(m);
	}

	public void insertEmp() {
		ModelDTO m = view.insertEmp();
		int result = s.insertEmp(m);
		view.printMsg(result > 0 ? "사원 등록 성공" : "사원 등록 실패");
	}

	public void updateEmp() {
		ModelDTO m = view.updateEmp();
		int result = s.updateEmp(m);
		view.printMsg(result > 0 ? "사원 수정 성공" : "사원 수정 실패");
	}

	public void deleteEmp() {
		int num = view.deleteEmp();
		int result = s.deleteEmp(num);
		view.printMsg(result > 0 ? "사원 삭제 성공" : "사원 삭제 실패");
	}

	public void selectDept() {
		List arr = view.selectDept();
		int result = s.selectDept(arr);
		int num=(int)arr.get(1);
		if (num==1)
			view.printMsg(result > 0 ? "부서 등록 성공" : "부서 등록 실패");
		else if (num == 2)
			view.printMsg(result > 0 ? "부서 수정 성공" : "부서 수정 실패");
		else if (num == 3)
			view.printMsg(result > 0 ? "부서 삭제 성공" : "부서 삭제 실패");
	}
}
