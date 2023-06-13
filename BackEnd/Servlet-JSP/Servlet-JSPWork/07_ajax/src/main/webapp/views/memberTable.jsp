<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.member.model.vo.Member" %>    
<%
	List<Member> members=(List)request.getAttribute("members");
%>
<table>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>나이</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>주소</th>
		<th>취미</th>
		<th>가입일</th>
	</tr>
	<%if(members.isEmpty()){ %>
		<tr>
			<td colspan="9">조회된 회원이 없습니다.</td> 
		</tr>
	<%}else{ 
		for(Member m : members){%>
		<tr>
			<td><%=m.getUserId() %></td>
			<td><%=m.getUserName() %></td>
			<td><%=m.getGender() %></td>
			<td><%=m.getAge() %></td>
			<td><%=m.getPhone() %></td>
			<td><%=m.getEmail() %></td>
			<td><%=m.getAddress() %></td>
			<td><%=Arrays.toString(m.getHobby()) %></td>
			<td><%=m.getEnrollDate() %></td>
		</tr>
	<%} 
	}%>
</table>

