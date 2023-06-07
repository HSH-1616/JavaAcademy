package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.Member;
import com.member.service.MemberService;

/**
 * Servlet implementation class MemberEnrollEnd
 */
@WebServlet("/memberenrollend.do")
public class MemberEnrollEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEnd() {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String[] hobby=request.getParameterValues("hobby");
		
		Member m=Member.builder()
				.userId(userId)
				.userPwd(password)
				.userName(userName)
				.age(age)
				.email(email)
				.gender(gender.charAt(0))
				.phone(phone)
				.address(address)
				.hobby(hobby)
				.build();
		int result=new MemberService().insertMember(m);
		if(result>0) {
		System.out.println("가입성공");
		RequestDispatcher rd=request.getRequestDispatcher("/main.jsp");
		rd.forward(request, response);
		}else {
		System.out.println("가입실패");
		RequestDispatcher rd=request.getRequestDispatcher("/views/member/memberenroll.jsp");
		rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
