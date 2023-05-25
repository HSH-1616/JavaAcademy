package com.jsp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.dto.MemberDTO;
import com.model.service.MemberService;

/**
 * Servlet implementation class SearchMember
 */
@WebServlet("/searchMember.do")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.클라이언트가 보낸 데이터를 가져온다.
		String name=request.getParameter("keyword");
//		System.out.println(name);
		
		//2.DB의 member테이블에 member_name컬럼에 클라이언트가 보낸 데이터와
		//일치하는 값이 있는지 확인, 있는값 가져오기
		List<MemberDTO> list=new MemberService().searchByName(name);
		
		//3.가져온 데이터 저장하기
		request.setAttribute("list", list);
		
		//4.화면설정
		request.getRequestDispatcher("/views/searchMember.jsp")
		.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
