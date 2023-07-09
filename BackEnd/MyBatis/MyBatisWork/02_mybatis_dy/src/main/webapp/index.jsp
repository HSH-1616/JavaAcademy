<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이바티스 동적쿼리</title>
</head>
<body>
	<h2>전체 사원 조회</h2>
	<h4>
		<a href="${path}/selectBsAll.do">전체 사원 조회</a>
	</h4>

	<h2>Data 연관관계 설정하기</h2>
	<h3>
		<a href="${path}/emp/association.do">join으로 객체 가져오기</a>
	</h3>
	
	<h2>부서 조회하기</h2>
	<h3>
		<a href="${path}/selectDeptAll.do">전체부서 조회하기</a>
	</h3>
	
	<h2>다른환경 접속하기</h2>
	<h3>
		<a href="${path}/member.do">회원 가져오기</a>
	</h3>
	
	<h2>게시글 가져오기</h2>
	<h3>
		<a href="${path}/board.do?no=12">게시글&댓글 전체 출력, 작성자 이름, 이메일 출력</a>
	</h3>


</body>
</html>