package com.ajax.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.web.admin.service.AdminService;
import com.web.member.model.vo.Member;

/**
 * Servlet implementation class JsonSimpleServlet
 */
@WebServlet("/basicJson.do")
public class JsonSimpleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonSimpleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<Member> list=new AdminService()
				.selectMemberByKeyword("userId", "a",1,30);
		System.out.println(list);
		Member m=list.get(0);
		System.out.println(m);
		
		//jsonsimple라이브러리를 이용해서 간편하게 객체를 전송할 수 있다.
		//단일객체를 전송 -> JSONObject클래스를 이용
		//다수객체를 전송 -> JSONArray클래스를 이용
		
		JSONObject jo=new JSONObject();
		//JSONObject가 제공하는 멤버메소드를 이용해서 전송할 데이터를 저장함.
		//key,value형식으로 저장
		//put()메소드를 제공
		jo.put("userId", m.getUserId());
		jo.put("userName", m.getUserName());
		jo.put("age", m.getAge());
		jo.put("height", 180.5);
		jo.put("flag",true);
		
		
		//다수데이터를 json으로 전송하기
		JSONArray joa=new JSONArray();
		//JSONArray에는 리스트방식으로 JSONObject를 저장 add()를 이용해서 저장
		for(Member m1 : list) {
			JSONObject j=new JSONObject();
			j.put("userId", m1.getUserId());
			j.put("userName", m1.getUserName());
			j.put("age", m1.getAge());
			j.put("gender", String.valueOf(m1.getGender()));
			j.put("phone", m1.getPhone());
			joa.add(j);
		}
		
		
		
		//생성된 JSONObject를 전송하면됨.
		response.setContentType("application/json;charset=utf-8");
		//response.getWriter().print(jo);
		response.getWriter().print(joa);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
