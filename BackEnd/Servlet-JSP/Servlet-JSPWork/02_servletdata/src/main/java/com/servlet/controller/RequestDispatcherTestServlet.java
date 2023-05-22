package com.servlet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestDispatcherTestServlet
 */
@WebServlet("/requestdispatchertest.do")
public class RequestDispatcherTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestDispatcherTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청내용을 다른 서블릿으로 전환하기.
		System.out.println("requestDispatcher 서블릿 실행");
		
		//데이터를 저장하기
		//HttpServletRequest객체가 제공하는 setAttribute()메소드를 이용한다.
		//key:value형식으로 저장함.
		//setAtrribute("key",value:object);
		request.setAttribute("testData","개인취향테스트에 오신걸 환영합니다.");
		
		
		
		//RequestDispatcher객체를 이용한 서블릿 이동하기
		//HttpServletRequest.getRequestDispatcher("(서블릿 || jsp)주소");를 이용
		RequestDispatcher rd=
				request.getRequestDispatcher("/dispatcherView.do");
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
