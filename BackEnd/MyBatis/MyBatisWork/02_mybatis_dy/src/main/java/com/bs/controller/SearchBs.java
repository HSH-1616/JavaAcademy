package com.bs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bs.model.service.BsServiceImpl;
import com.bs.model.service.BsServiceInter;
import com.bs.model.vo.Bs;

/**
 * Servlet implementation class SearchBs
 */
@WebServlet("/searchBs.do")
public class SearchBs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BsServiceInter service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service=new BsServiceImpl();
		request.setCharacterEncoding("utf-8");				
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		String gender=request.getParameter("gender");
		String salary=request.getParameter(("salary").equals("")?"0":request.getParameter("salary"));
		String salFlag=request.getParameter("salFlag");
		String[] deptCode=request.getParameterValues("deptCode");
		String[] jobCode=request.getParameterValues("jobCode");
		String enrollDate=request.getParameter("enrollDate");
		String dateFlag=request.getParameter("dateFlag");
		
		Map<String,Object> param=new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		param.put("gender", gender);
		param.put("salary", salary);
		param.put("salFlag", salFlag);
		param.put("deptCode",deptCode);
		param.put("jobCode",jobCode);
		param.put("enrollDate",enrollDate);
		param.put("dateFlag",dateFlag);
		List<Bs> employees=service.searchBs(param);
		
		request.setAttribute("emps", employees);
		request.getRequestDispatcher("/views/bs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
