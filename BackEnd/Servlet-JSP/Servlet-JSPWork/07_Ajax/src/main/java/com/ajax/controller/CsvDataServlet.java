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
 * Servlet implementation class CsvDataServlet
 */
@WebServlet("/ajax/csvdata.do")
public class CsvDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsvDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Actor> actors=List.of(
				Actor.builder().name("박보검").phone("01012345678").profile("parkBogum.jpg").build(),
				Actor.builder().name("줄리아로버츠").phone("01022222222").profile("juliaRoberts.jpg").build(),
				Actor.builder().name("맷데이몬").phone("01033333333").profile("mattDamon.jpg").build()
				);
		
		String csv="";
		for(int i=0;i<actors.size();i++) {
			if(i!=0) csv+="\n";
			csv+=actors.get(i);
		}
		System.out.println(csv);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(csv);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
