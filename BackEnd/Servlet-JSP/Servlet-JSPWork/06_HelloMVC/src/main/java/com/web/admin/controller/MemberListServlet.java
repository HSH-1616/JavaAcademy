package com.web.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.admin.service.AdminService;
import com.web.member.dto.MemberDTO;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/admin/memberList.do")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징처리하기
		int cPage=0;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage=10;
		
		
		//1.DB에서 member테이블에 있는 데이터 가져오기
		List<MemberDTO> m=new AdminService().memberList(cPage,numPerpage);
//		System.out.println(m);
		//2.DB에서 가져온 데이터 저장(화면출력)
		request.setAttribute("memberList", m);
		
		//페이지바 구성
		//1) DB에 저장된 전체 데이터의 수를 가져오기
		int totalData=new AdminService().selectMemberCount();
		//2) 전체 페이지수를 계산하기 * 소수점 주의!
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=10;
		//3) 페이지바 시작번호 계산하기
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		//4) 페이지 바를 구성하는 html 저장하기
		String pageBar="";
		//이전표시하기
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		//선택할 페이지 번호 출력하기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURI()+"?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//다음 출력
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
			
		//3.출력할 화면을 선택(이동)
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request, response);
		}		
			
	/**		
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}		
}			