<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.data.model.vo.Animal" %>
    <% 
    	List<Animal> list=(List)request.getAttribute("animals");
    	String sessiondata=(String)session.getAttribute("loginId");
    	String context=(String)application.getAttribute("contextData");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>내장객체 저장된 데이터 불러오기</h2>
	<h3>session : <%=sessiondata %></h3>
	<h3>context : <%=context %></h3>
	<%if(list!=null&&!list.isEmpty()) {
		for(Animal a : list){%>
			<p><%=a %></p>
	 	<%} %>
	<%} %>
 
</body>
</html>