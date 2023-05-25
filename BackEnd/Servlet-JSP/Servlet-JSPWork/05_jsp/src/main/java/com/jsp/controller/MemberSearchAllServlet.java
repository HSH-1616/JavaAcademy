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
 * Servlet implementation class MemberSearchAllServlet
 */
@WebServlet("/memberAll.do")
public class MemberSearchAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//student계정의 Member테이블에 있는 모든 데이터를 조회하는 기능
		//1.DB에서 필요한 데이터를 가져온다. -> JDBC을 이용
		List<MemberDTO> members=new MemberService().selectMemberAll();
		
		//화면에 조회한 데이터를 전달하는 방법
		request.setAttribute("members", members);
		
		//2.DB정보를 출력할 화면을 선택한다. -> jsp을 이용
		RequestDispatcher rd=request.getRequestDispatcher("/views/memberList.jsp");
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
