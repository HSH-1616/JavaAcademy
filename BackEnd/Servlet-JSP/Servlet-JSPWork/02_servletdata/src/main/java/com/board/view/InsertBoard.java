package com.board.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertBoard
 */
@WebServlet("/InsertBoardView.do")
public class InsertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		int rand=(int)request.getAttribute("random");
		System.out.println(rand);
		
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String comment=request.getParameter("comment");
		
		String html="<html>";
		html+="<head>";
		html+="</head>";
		html+="<body>";
		html+="<h3>"+rand+"</h3>";
		html+="<h3>"+title+"</h3>";
		html+="<h3>"+writer+"</h3>";
		html+="<h3>"+comment+"</h3>";
		html+="</body>";
		html+="</html>";
		out.write(html);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
