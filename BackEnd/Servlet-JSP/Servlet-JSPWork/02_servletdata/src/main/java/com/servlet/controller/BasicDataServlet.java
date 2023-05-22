package com.servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BasicDataServlet extends HttpServlet {

	private static final long serialVersionUID = 2937201686194537998L;
	
	public BasicDataServlet() {

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("서블릿 실행");
//		클라이언트가 전송한 데이터 받아오기
		//HttpServletRequest객체가 제공하는 메소드를 이용해서 받아올수 있다.
		//getParameter()메소드 -> 클라이언트가 보낸 데이터 한개를 받아온다.
		String data=req.getParameter("testdata");//String
		System.out.println(data);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
}
