<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el에서 추가데이터 출력하기</title>
</head>
<body>
	<h2>컨텍스트에 대한 정보</h2>
	<h3>${pageContext.request.contextPath }</h3>
	<h3>${pageContext.request.requestURI }</h3>
	<h3>${pageContext.request.requestURL }</h3>
	<h2>Cookie 정보출력하기</h2>
	<h3>cookie : ${cookie }</h3>
	<h3>cookie : ${cookie.JSESSIONID.name }</h3>
	<h3>cookie : ${cookie.JSESSIONID.value }</h3>
	<h3>Header정보출력하기</h3>
	<h3>${header }</h3>
	<h3>${header["user-agent"]}</h3>
	<h3>${header.host}</h3>
</body>
</html>