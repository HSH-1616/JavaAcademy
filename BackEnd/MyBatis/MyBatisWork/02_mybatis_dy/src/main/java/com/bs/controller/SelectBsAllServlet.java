package com.bs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bs.model.service.BsService;
import com.bs.model.service.BsServiceImpl;
import com.bs.model.service.BsServiceInter;
import com.bs.model.vo.Bs;

/**
 * Servlet implementation class SelectBsAllServlet
 */
@WebServlet("/selectBsAll.do")
public class SelectBsAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BsServiceInter service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectBsAllServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		service=new BsServiceImpl();
		
		int cPage, numPerpage;

		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (Exception e) {
			cPage = 1;
		}

		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		} catch (Exception e) {
			numPerpage = 10;
		}

		int totalData =service.selectBsCount();
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		String pageBar = "<ul class='pagination justify-content pagenation-sm data-bs-theme=dark'>";
		if (pageNo == 1) {
			pageBar += """
					<li class='page-item disabled'>
						<a class='page-link' href='#'>이전</a>
					</li>
					""";
		} else {
			pageBar += "<li class='page-item '>";
			pageBar += "<a class='page-link' href='" + request.getRequestURI() + "?cPage=" + (pageNo - 1) + "'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item disabled'>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='" + request.getRequestURI() + "?cPage=" + (pageNo) + "'>"
						+ pageNo + "</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += """
					<li class='page-item disabled'>
						<a class='page-link' href='#'>다음</a>
					</li>
					""";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='" + request.getRequestURI() + "?cPage=" + (pageNo) + "'>다음</a>";
			pageBar += "</li>";
		}
		pageBar += "</ul>";

		List<Bs> employees = service.selectBsAll(cPage, numPerpage);
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("emps", employees);
		request.getRequestDispatcher("/views/bs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
