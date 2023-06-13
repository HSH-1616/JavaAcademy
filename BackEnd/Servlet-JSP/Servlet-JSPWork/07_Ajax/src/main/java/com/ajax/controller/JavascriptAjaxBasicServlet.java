package com.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JavascriptAjaxBasicServlet
 */
@WebServlet("/js/ajax.do")
public class JavascriptAjaxBasicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavascriptAjaxBasicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax서비스 실행!");
		//ajax로 클라이언트가 보낸 데이터 가져오기
		String param=request.getParameter("param");
		System.out.println(param);
		
		response.setContentType("text/csv;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print("데이터 요청처리!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		System.out.println("post방식요청응답");
		
		String paramData=request.getParameter("param");
		System.out.println(paramData);
		
		new Thread(()->{
			try {
				Thread.sleep(4000);
			}catch(InterruptedException e) {
				e.printStackTrace();
			}
		}).run();
				
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print("<h2>post 요청에 대한 응답</h2>");
		
	}

}
