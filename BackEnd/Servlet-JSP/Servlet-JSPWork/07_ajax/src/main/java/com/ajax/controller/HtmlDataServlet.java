package com.ajax.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.model.vo.Actor;

/**
 * Servlet implementation class HtmlDataServlet
 */
@WebServlet("/ajax/htmlTest.do")
public class HtmlDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtmlDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Actor> actors=List.of(
				Actor.builder().name("박보검").phone("01043259874")
				.profile("parkBogum.jpg").build(),
				Actor.builder().name("쥴리아로버츠").phone("01023486637")
				.profile("juliaRoberts.jpg").build(),
				Actor.builder().name("멧데이먼").phone("01012231432")
				.profile("mattDamon.jpg").build()
				);
		
		request.setAttribute("actors", actors);
		
		request.getRequestDispatcher("/views/htmlresponse.jsp")
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
