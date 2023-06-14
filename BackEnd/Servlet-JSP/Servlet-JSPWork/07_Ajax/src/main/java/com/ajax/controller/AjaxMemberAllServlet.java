package com.ajax.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.service.AdminService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class AjaxMemberAllServlet
 */
@WebServlet("/memberAll.do")
public class AjaxMemberAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Member> members=new AdminService().selectMemberAll(1, 100);
		//members.stream().forEach(System.out::println);
		
		String resultData=members.stream()
				.map(e->e.toString())
				.collect(Collectors.joining("\n"));
		
		System.out.println(resultData);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(resultData);
		
//		request.setAttribute("members", members);
//		
//		request.getRequestDispatcher("/views/memberTable.jsp")
//		.forward(request, response);
	
		//csv방식으로 데이터를 보내
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
