package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.dto.MemberDTO;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class CheckMemberServlet
 */
@WebServlet(name="login",urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		
		MemberDTO loginMember=new MemberService().checkMember(userId, password);
		
		//아이디저장 로직처리
		String saveId=request.getParameter("saveId");
		System.out.println(saveId);
		
		//checkbox에 check가 되면 on
		//checkbox에 check가 안되면 null
		if(saveId!=null) {
			Cookie c=new Cookie("saveId",userId);
			c.setMaxAge(60*60*24*7);
			response.addCookie(c);
		}else {
			Cookie c=new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
				
//		System.out.println(loginMember);
		if(loginMember!=null) {
			//로그인 성공
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", loginMember);			
			response.sendRedirect(request.getContextPath());
		}else {
			//로그인 실패
			//실패 메세지 출력
			request.setAttribute("msg", "아이디, 패스워드가 일치하지 않습니다.");	
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
