<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.model.dto.MemberDTO" %>    
<%
	List<MemberDTO> members=(List)request.getAttribute("list");   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 검색 결과</h3>
	
	<div id="result-container">
		<table>
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>취미</th>
				<th>가입일</th>			
			</tr>
			<%if(members==null||members.isEmpty()){ %>
				<tr>
					<td colspan="10"><%=request.getParameter("keyword") %>(으)로 회원이 없습니다</td>					
				</tr>				
			<%}else{ 
				for(MemberDTO m:members){
			%>
					<tr>
					<td><%=m.getMemberId() %></td>
					<td><%=m.getMemberPwd() %></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getAge() %></td>
					<td><%=m.getGender() %></td>
					<td><%=m.getEmail() %></td>
					<td><%=m.getPhone() %></td>
					<td><%=m.getAddress() %></td>
					<td><%=m.getHobby() %></td>
					<td><%=m.getEnrollDate() %></td>					
					</tr>					
				<%} %>							
			<%} %>
		</table>
	</div>
</body>
</html>