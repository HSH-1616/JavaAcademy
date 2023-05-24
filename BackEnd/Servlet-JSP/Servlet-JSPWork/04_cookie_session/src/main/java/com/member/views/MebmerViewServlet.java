package com.member.views;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;

/**
 * Servlet implementation class MebmerViewServlet
 */
@WebServlet("/memberView.do")
public class MebmerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MebmerViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		List<Member> members=(List)request.getAttribute("members");
		
		String html="<table>";
		html+="<tr>";
		html+="<th>아이디</th>";
		html+="<th>패스워드</th>";
		html+="<th>이름</th>";
		html+="<th>나이</th>";
		html+="<th>성별</th>";
		html+="<th>이메일</th>";
		html+="<th>전화번호</th>";
		html+="<th>주소</th>";
		html+="<th>취미</th>";
		html+="<th>가입일</th>";
		html+="</tr>";
		for(Member m:members) {
			html+="<tr>";
			html+="<td>"+m.getMemberId()+"</td>";
			html+="<td>"+m.getMemberPwd()+"</td>";
			html+="<td>"+m.getMemberName()+"</td>";
			html+="<td>"+m.getAge()+"</td>";
			html+="<td>"+m.getGender()+"</td>";
			html+="<td>"+m.getEmail()+"</td>";
			html+="<td>"+m.getPhone()+"</td>";
			html+="<td>"+m.getAddress()+"</td>";
			html+="<td>"+m.getHobby()+"</td>";
			html+="<td>"+m.getEnrollDate()+"</td>";
			html+="</tr>";
		}
		html+="</table>";
		out.print(html);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
