package com.servlet.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "enrollMember",urlPatterns ={"/enrollMember.do"})
public class EnorllMemberServlet extends HttpServlet {

	private static final long serialVersionUID = -1388204621530006200L;
	
	public EnorllMemberServlet() {

}
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//인코딩 처리하기
	//HttpServletRequest.serCharacterEncoding()메소드를 이용
	req.setCharacterEncoding("UTF-8");
	
	Map<String,String[]> param=req.getParameterMap();
	for(String key: param.keySet()) {
		System.out.println(key+" : "+Arrays.toString(param.get(key)));
	}	
}
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	this.doGet(req, resp);	
}

}
