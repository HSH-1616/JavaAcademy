package com.cookie.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UseCookieServlet
 */
@WebServlet("/usecookie.do")
public class UseCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UseCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//쿠키값 가져오기
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				System.out.println(c.getName());
				System.out.println(c.getValue());
				if(c.getName().equals("readBoard")){
					String[] data=c.getValue().split("||");
					System.out.println(Arrays.toString(data));
				}
			}
		}
		
		HttpSession session=request.getSession(false);
		String data=(String)session.getAttribute("data");
		System.out.println(data);
		
		String contextData=getServletContext().getInitParameter("admin");
		System.out.println(contextData);
		
		String servletdata=getInitParameter("servletdata");
		System.out.println(servletdata);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
