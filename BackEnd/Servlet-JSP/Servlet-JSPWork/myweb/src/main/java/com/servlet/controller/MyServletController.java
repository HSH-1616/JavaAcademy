package com.servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServletController extends HttpServlet{

	private static final long serialVersionUID = -7432085992729084155L;
	
	public MyServletController() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		System.out.println("MyServletController get방식 응답");
	}
	
	@Override
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		System.out.println("MyServletController Post방식 응답");
	}
}
