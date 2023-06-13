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
 * Servlet implementation class AjaxIUserIdSearchServlet
 */
@WebServlet("/searchId.do")
public class AjaxIUserIdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIUserIdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("id");
		System.out.println(userId);
		List<Member> members
		=new AdminService().selectMemberByKeyword("userId", userId, 1, 30);
		//members.stream().forEach(System.out::println);
//		List<String> userIds=members.stream()
//				.map(e->e.getUserId()).collect(Collectors.toList());
//		System.out.println(userIds);
		String data="";
		for(int i=0;i<members.size();i++) {
			if(i!=0) data+=",";
			data+=members.get(i).getUserId();
		}
		System.out.println(data);
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(data);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
