package com.servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//어노테이션방식으로 servlet을 등록할수있음
//클래스 선언부에 @WebServlet어노테이션을 선언함.
//@WebServlet어노테이션의 속성설정으로 urlpattern, name을 설정할 수 있다.
@WebServlet(name = "paramdata",urlPatterns ={"/testperson.do"})
public class ParameterDataServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7348993035964273633L;
	
	public ParameterDataServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트가 보낸 데이터 확인하기
		//1. 단일 데이터 가져오기
		// HttpServletRequest.getParameter("key")메소드를 이용한다.
		String name=req.getParameter("name");
		int age=Integer.parseInt(req.getParameter("age"));
		double height=Double.parseDouble(req.getParameter("height"));
		String color=req.getParameter("color");
		String animals=req.getParameter("animal");
		//클라이언트가 동일한 key로 다수의 값을 보낸데이터는
		//HttpServletRequest.getParameterValues()메소드를 이용한다.
		//getParameterValues는 다수의 값을 String배열로 반환한다!
		String[] animals2=req.getParameterValues("animal");
		
		String lunch=req.getParameter("lunch");
		String info=req.getParameter("info");
				
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("키 : " + height);
		System.out.println("좋아하는 색 : " + color);
		System.out.println("좋아하는 동물 : " + animals);
		System.out.println("동물들....");
		Arrays.asList(animals2).stream().forEach(System.out::print);
		System.out.println();
		System.out.println("점심 : " + lunch);
		System.out.println("정보 : " + info);
		
		//클라이언트가 보낸 데이터의 key를 모를때....
		//전송된 key값을 가져오는 방법
		//HttpServletRequest.getParameterNames();메소드 이용
		Enumeration<String> paramName=req.getParameterNames();
		while(paramName.hasMoreElements()) {
			String key=paramName.nextElement();
			System.out.println(key);
			String[] value=req.getParameterValues(key);
			System.out.println(Arrays.toString(value));
		}
		
		//클라이언트가 보낸 데이터 Map방식으로 가져오기
		Map<String,String[]> param=req.getParameterMap();
		for(String key: param.keySet()) {
			System.out.println(key+" : "+Arrays.toString(param.get(key)));
		}	
		
		//클라이언트의 응답데이터 작성하기
		//HttpServletResponse 객체가 제공하는 메소드를 이용한다.
		//1. 응답데이터를 작성하기 contentType을 설정
		//MIME TYPE 설정
		//setContentType("MIMETYPE설정");
		resp.setContentType("text/html;charset=utf-8");
		//2. 응답데이터 보내기
		// 1)문자열 데이터 : 문자열 스트림으로 -> getWriter();
		// 2)바이너리 데이터 : 파일 스트림으로 전송 -> getOutptStream();
		PrintWriter out=resp.getWriter();
		//3. 원하는 데이터 전송하기
//		out.write("<h3>내가 만든 첫 응답페이지</h3>");
		String html="<html>";
		html+="<head>";
		html+="<title>개인취향테스트</title>";
		html+="</head>";
		html+="<body>";
		html+="<h3>개인취향결과</h3>";
		html+="<h4>"+name+"님의 개인취향 확인결과</h4>";
		html+="<h4>당신의 이름은"+name+"이고 나이는 "+age+"살 이고, 키는"+height+"cm입니다</h4>";
		html+="<h4>좋아하는 색은 <span style='color : "+color+"'>"+color+"</span> 입니다.</h4>";
		html+="<ul>좋아하는 동물";
		for(String animal:animals2) {
			String src="";
			switch(animal) {
			case "강아지" : src="https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525081724428qquq.jpg";break;
			case "고양이" : src="data:image/jpeg;base64,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";break;
			case "펭귄" : src="https://static.hubzum.zumst.com/hubzum/2020/08/21/10/16af61affa8841f58caaedd241064824.jpg";break;
			case "기린" : src="https://www.sciencetimes.co.kr/wp-content/uploads/2021/03/giraffe-5128394_1920.jpg";break;
			}
			html+="<li><img src='"+src+"' width=200 height=200></li>";
		}
		html+="</ul>";
		html+="<p>오늘의 점심은 "+lunch+" 입니다.</p>";
		html+="<h3>당신은 "+info+"</h3>";
		html+="</body>";
		html+="</html>";
		out.write(html);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
}
