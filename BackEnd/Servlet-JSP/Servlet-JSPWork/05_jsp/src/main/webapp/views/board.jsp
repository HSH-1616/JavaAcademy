<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	<section>
	<p><%=headerData %></p>
		<table>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>			
			</tr>
			<tr>
				<th>제목1</th>
				<th>작성자1</th>
				<th>작성일1</th>			
			</tr>
		</table>	
	</section>
	<%@ include file="/views/common/footer.jsp" %>	
</body>
</html>