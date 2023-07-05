<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>내용</td>
				<td>등록일</td>
			</tr>
			<tr>
				<td><c:out value="${board.no }" /></td>
				<td><c:out value="${board.title }" /></td>
				<td><c:out value="${board.writer }" /></td>
				<td><c:out value="${board.content }" /></td>
				<td><fmt:formatDate value="${board.boardDate }" type="date" pattern="yyyy/MM/dd"/></td>
			</tr>
		</table>
		
		<ul>
		<li>${requestScope.test }</li>
		<li>${sessionScope.test }</li>
		<li>${applicationScope.test }</li>
		</ul>

</body>
</html>