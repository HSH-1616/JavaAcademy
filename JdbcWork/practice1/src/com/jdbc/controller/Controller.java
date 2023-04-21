package com.jdbc.controller;

import java.util.List;

import com.jdbc.model.dto.ModelDTO;
import com.jdbc.model.service.Service;
import com.jdbc.view.MainView;

public class Controller {
	private Service s=new Service();
	private MainView view=new MainView();
	
	public void mainMenu() {
		view.mainMenu();
	}
	
	public void selectAllMember() {
		List<ModelDTO> m=s.selectAllMember();
		view.printMembers(m);
	}
}
