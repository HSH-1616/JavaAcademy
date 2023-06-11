package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.AESEncryptor;
import com.web.member.model.service.MemberService;
import com.web.member.model.vo.Member;

@WebServlet("/member/enrollMemberEnd.do")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		try {
			email=AESEncryptor.encryptData(email);
		}catch(Exception e) {
			System.out.println("email 암호화실패");
		}
		String phone=request.getParameter("phone");
		try {
			phone=AESEncryptor.encryptData(phone);
		}catch(Exception e) {
			System.out.println("phone 암호화실패");
		}
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String[] hobbies=request.getParameterValues("hobby");
		Member m=Member.builder()
				.userId(userId)
				.password(password)
				.userName(userName)
				.age(age)
				.email(email)
				.gender(gender.charAt(0))
				.phone(phone)
				.address(address)
				.hobby(hobbies)
				.build();
//		try {
//			m.setEmail(AESEncryptor.encryptData(m.getEmail()));
//		}catch(Exception e) {
//			
//		}
		int result=new MemberService().insertMember(m);
		String msg="",loc="";
		if(result>0) {
			//입력성공
			msg="회원가입을 축하드립니다!";
			loc="/";
		}else {
			//입력실패
			msg="회원가입에 실패하였습니다. :( \n다시 시도하세요!";
			loc="/member/enrollMember.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request,response);
		
		
//		System.out.println(userId);
//		System.out.println(password);
//		System.out.println(userName);
//		System.out.println(age);
//		System.out.println(email);
//		System.out.println(phone);
//		System.out.println(address);
//		System.out.println(gender);
//		System.out.println(Arrays.toString(hobbies));
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
