<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본mybatis적용하기</title>
</head>
<body>
	<h2>mybatis 실행해보기</h2>
	<h3>
		<a href="${path }/insertStudent.do">학생등록</a>
	</h3>

	<div>
		<form action="${path }/insertStudentByName.do">
			<input type="text" name="name"> 
			<input type="submit" value="저장">
		</form>
	</div>
	
	<h2>학생정보를 입력받아 추가하기</h2>
	<form action="${path }/insertStudentAll.do" method="post">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="phone" placeholder="전화번호"><br>
		<input type="email" name="email" placeholder="이메일"><br>
		<input type="text" name="address" placeholder="주소"><br>
		<input type="submit" value="저장"><br>		
	</form>
	
	<h2>학생정보 수정하기</h2>
	<form action="${path }/updateStudent.do" method="post">
		<p>수정할 학생 이름</p>
		<input type="text" name="name" placeholder="이름"><br>
		<p>수정할 정보</p>
		<input type="text" name="phone" placeholder="전화번호"><br>
		<input type="email" name="email" placeholder="이메일"><br>
		<input type="text" name="address" placeholder="주소"><br>
		<input type="submit" value="저장"><br>		
	</form>
	
	<h2>학생정보 삭제하기</h2>
	<form action="${path }/deleteStudent.do" method="post">
		<p>삭제할 학생 번호</p>
		<input type="text" name="no" placeholder="학생번호"><br>		
		<input type="submit" value="저장"><br>		
	</form>
	
	<h2>DB에 저장된 데이터 조회하는 기능 구현하기</h2>
	<p>select문을 이용해서 DB에서 조회하고 그 결과를 java의 특정 클래스로 저장</p>
	<p>select문을 실행한 후 조회한 DB의 데이터와 지정한 java 클래스를 연결해줌.</p>
	<h3>학생 수 조회하기</h3>
	<h4><a href="${path}/student/studentCount.do">학생수 조회</a></h4>
	
	<h3>학생번호로 조회하기</h3>
	<h4> 
		<a href="${path}/student/selectStudent.do?no=1">1번 학생 조회</a>
	</h4>
	
	<h3>전체학생 조회하기</h3>
	<h4> 
		<a href="${path}/student/selectStudentAll.do">전체 학생 조회</a>
	</h4>
	
	<h3>이름으로 조회하기</h3>
	<form action="${path }/selectStudentByName.do" method="post">
		<input type="text" name="name" placeholder="학생이름"><br>		
		<input type="submit" value="저장"><br>		
	</form>
	
	<h3>vo를 생성하지 않고 데이터 가져오기</h3>
	<p>Map을 이용해서 데이터를 가져올 수 있다.</p>
	<h4><a href="${path }/student/selectStudentMap?no=1">1번학생조회</a></h4>
	<p>map으로 다수데이터 출력하기</p>
	<h4><a href="${path }/student/selectStudentMapAll">전체 학생조회</a></h4>
	
	<p>마이바티스 페이징 처리</p>
	<h4><a href="${path }/student/selectStudentPage">페이징 처리하기</a></h4>
	
</body>
</html>