<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/searchBs.do"
		method="post">
		<table>
			<tr>
				<td><select name="type">
						<option value="emp_id">사원번호</option>
						<option value="emp_name">사원이름</option>
						<option value="email">이메일</option>
						<option value="phone">전화번호</option>
				</select></td>
				<td><input type="text" name="keyword"></td>
			</tr>
			<tr>
				<td><label><input type="radio" name="gender" value="M">남</label>
					<label><input type="radio" name="gender" value="F">여</label>
				</td>
			</tr>
			<tr>
				<td>급여</td>
				<td><input type="number" name="salary" step="500000"
					min="1200000"> <label><input type="radio"
						name="salFlag" value="ge">이상</label> <label><input
						type="radio" name="salFlag" value="le">이하</label></td>
			</tr>
			<tr>
				<td>부서조회</td>
				<td><label><input type="checkbox" name="deptCode"
						value="D1">인사관리부</label> <label><input type="checkbox"
						name="deptCode" value="D2">회계관리부</label> <label><input
						type="checkbox" name="deptCode" value="D3">마케팅부</label> <label><input
						type="checkbox" name="deptCode" value="D4">국내영업부</label> <label><input
						type="checkbox" name="deptCode" value="D5">해외영업1부</label> <label><input
						type="checkbox" name="deptCode" value="D6">해외영업2부</label> <label><input
						type="checkbox" name="deptCode" value="D7">해외영업3부</label> <label><input
						type="checkbox" name="deptCode" value="D8">기술지원부</label> <label><input
						type="checkbox" name="deptCode" value="D9">총무부</label></td>
			</tr>
			<tr>
				<td>직급조회</td>
				<td><label><input type="checkbox" name="jobCode"
						value="J1">대표</label> <label><input type="checkbox"
						name="jobCode" value="J2">부사장</label> <label><input
						type="checkbox" name="jobCode" value="J3">부장</label> <label><input
						type="checkbox" name="jobCode" value="J4">차장</label> <label><input
						type="checkbox" name="jobCode" value="J5">과장</label> <label><input
						type="checkbox" name="jobCode" value="J6">대리</label> <label><input
						type="checkbox" name="jobCode" value="J7">사원</label></td>
			</tr>
			<tr>
				<td>
					<label><input type="date" name="enrollDate"></label>
				</td>
				<td>
					<label><input type="radio" name="dateFlag" value="ge">이후</label> 
					<label><input type="radio" name="dateFlag" value="le">이전</label>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>

	<div class="container mt-3">
		<table class="table">
			<c:choose>
				<c:when test="${empty emps}">
					<tbody>
						<tr>
							<th>등록된 사원이 없습니다.</th>
						</tr>
					</tbody>
				</c:when>
				<c:otherwise>
					<thead>
						<tr>
							<th>사원 번호</th>
							<th>사원 이름</th>
							<th>주민번호</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>부서 코드</th>
							<th>직급 코드</th>
							<th>월급</th>
							<th>보너스</th>
							<th>입사일</th>
							<th>성별</th>
						</tr>
					</thead>
					<c:forEach var="bs" items="${emps }">
						<tbody>
							<tr>
								<td><c:out value="${bs.empId }" /></td>
								<td><c:out value="${bs.empName }" /></td>
								<td><c:out value="${bs.empNo }" /></td>
								<td><c:out value="${bs.phone}" /></td>
								<td><c:out value="${bs.email}" /></td>
								<td><c:out value="${bs.deptCode}" /></td>
								<td><c:out value="${bs.jobCode}" /></td>
								<td><fmt:formatNumber value="${bs.salary}" type="currency" /></td>
								<td><c:out value="${bs.bonus}" /></td>
								<td><fmt:formatDate value="${bs.hireDate }" /></td>
								<td><c:out value="${bs.gender=='F'?'여':'남'}" /></td>
							</tr>
						</tbody>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div style="display: flex; justify-content: center">
		<c:out value="${pageBar}" escapeXml="false" />
	</div>



</body>
</html>