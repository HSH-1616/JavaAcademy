package com.servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShareDataServlet
 */
@WebServlet("/sharedata.do")
public class ShareDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//각 객체에 데이터 저장하기
		//HttpServletRequest객체에 데이터 저장하기
		request.setAttribute("requestdata", "requestDataTest");
		
		//HttpSession 객체 이용하기
		//1. HttpSession 객체를 생성 
		//		-> HttpServletRequest제공하는 getSession() 메소드 이용
		HttpSession session=request.getSession();
		
		//2. HttpSession.setAttribute()메소드를 이용해서 저장
		session.setAttribute("sessiondata", "sessionDataTest");
		
		//ServletContext객체 이용하기
		//1. ServletContext객체 생성
		//		-> HttpServletRequest가 제공하는 getServletContext()메소드 이용, getServletContext()메소드 이용,
		//			getServletContext()를 이용
		ServletContext context=request.getServletContext();
		context=getServletContext();
		context.setAttribute("contextdata","contextDataTest");

		RequestDispatcher rd=request.getRequestDispatcher("/checkData.do");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
