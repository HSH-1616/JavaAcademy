package com.bs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bs.model.service.BsServiceImpl;
import com.bs.model.service.BsServiceInter;
import com.bs.model.vo.Board;

/**
 * Servlet implementation class MemberBoardCommentServlet
 */
@WebServlet("/board.do")
public class BoardTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BsServiceInter service=new BsServiceImpl();
		int no=Integer.parseInt(request.getParameter("no"));
		Board b=service.selectBoard(no);
		System.out.println(b);
		request.setAttribute("b", b);
		request.getRequestDispatcher("/views/boardTest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
